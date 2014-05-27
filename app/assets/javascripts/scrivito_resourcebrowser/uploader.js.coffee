@ResourcebrowserUploader = do ->
  dropZoneSelector: '.editing-resourcebrowser-items'
  dropOverCssClass: 'uploader-drag-over'
  mimeTypeMapping:
    'image/*': 'Image'
    'video/*': 'Video'

  _initializeBindings: ->
    dropZone = @modal.find(@dropZoneSelector)

    dropZone.on 'dragover', (event) =>
      $(event.currentTarget).addClass(@dropOverCssClass)
      event.preventDefault()

    dropZone.on 'dragleave', (event) =>
      $(event.currentTarget).removeClass(@dropOverCssClass)
      event.preventDefault()

    dropZone.on 'drop', (event) =>
      $(event.currentTarget).removeClass(@dropOverCssClass)
      @_onDrop(event)
      event.preventDefault()

  _objClassForMimeType: (mimeType) ->
    for mime, objClass of @mimeTypeMapping
      return objClass if mimeType.match(mime)

    undefined

  _processQueue: (queue, createdObjs, promise) ->
    promise.then (data) =>
      @onUploadSuccess(data)

    file = queue.pop()

    if file?
      @_createResource(file).then (obj) =>
        @_updateProgress(file, '100%')
        createdObjs.push(obj)
      .always =>
        @_processQueue(queue, createdObjs, promise)

      return promise
    else
      return promise.resolve(createdObjs)

  _addProgressWrapper: () ->
    itemsElement = $('.editing-resourcebrowser-items').empty()

    $('<div></div>')
      .addClass('editing-resourcebrowser-loading')
      .appendTo itemsElement

    $('<div></div>')
      .addClass('editing-resourcebrowser-progress-wrapper')
      .appendTo itemsElement

  _addProgress: (file) ->
    progressBar = $('<div></div>')
      .addClass('editing-resourcebrowser-progress-bar')
      .css('width', '10%')

    progress = $('<div></div>')
      .addClass('editing-resourcebrowser-progress')
      .html(progressBar)

    fileName = $('<p></p>')
      .html(file.name)

    $('<div></div>')
      .addClass('editing-resourcebrowser-progress-file')
      .append(fileName)
      .append(progress)
      .prependTo $('.editing-resourcebrowser-progress-wrapper')

    file['progressBar'] = progressBar

  _updateProgress: (file, percent) ->
    file.progressBar.css('width', percent)

  _onDrop: (event) ->
    dataTransfer = event.originalEvent.dataTransfer

    unless dataTransfer?
      return

    files = dataTransfer.files

    if files.length == 0
      return

    @onUploadStart(queue)
    @_addProgressWrapper()

    promise = $.Deferred()

    queue = for file in files
      @_addProgress(file)
      file

    @_processQueue(queue, [], promise)

    promise

  _randomResourceId: ->
    hex = Math.floor(Math.random() * Math.pow(16, 8)).toString(16)

    while (hex.length < 8)
      hex = '0' + hex

    hex

  _createResource: (file) ->
    objName = file.name.replace(/[^a-z0-9_.$\-]/ig, '-')
    path = "_resources/#{@_randomResourceId()}/#{objName}"

    scrivito.create_obj
      blob: file
      _path: path
      _obj_class: @_objClassForMimeType(file.type)

  init: (@modal) ->
    @_initializeBindings()

  # Hook for 3rd parties when the upload starts.
  onUploadStart: (files) ->

  # Hook for 3rd parties when the upload fails.
  onUploadFailure: (error) ->

  # Hook for 3rd parties when the upload was successful.
  onUploadSuccess: (objs) ->

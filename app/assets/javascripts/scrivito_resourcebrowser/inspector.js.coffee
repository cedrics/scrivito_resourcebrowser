@ResourcebrowserInspector = do ->
  inspectorSelector: '.editing-resourcebrowser-inspector'
  contentSelector: '.inspector-content'
  inspector: undefined
  objectId: undefined

  _initializeBindings: ->
    @modal.on 'click', 'li.resourcebrowser-item', (event) =>
      @_onInspect(event)

    @inspector = @modal.find(@inspectorSelector)
    @inspector.hide()

  _onInspect: (event) ->
    if $(event.target).hasClass('editing-resourcebrowser-inspect')
      currentTarget = $(event.currentTarget)
      id = currentTarget.data('id')

      if id
        @open(id)
        @_highlightItem(currentTarget)

  _renderLoading: ->
    @inspector.html(@_loadingTemplate())

  _loadingTemplate: ->
    icon = $('<i></i>')
      .addClass('editing-icon editing-icon-refresh')

    $('<div></div>')
      .addClass('editing-resourcebrowser-loading')
      .html(icon)

  _highlightItem: (element) ->
    @modal.find('li.resourcebrowser-item.active').removeClass('active')
    element.addClass('active')

  init: (modal) ->
    @modal = modal
    @_initializeBindings()

  # Opens the inspector section in the resourcebrowser for the given object ID and displays its edit
  # view.
  open: (objectId) ->
    @objectId = objectId

    @inspector.show()
    @_renderLoading()

    $.ajax
      url: '/resourcebrowser/inspector'
      dataType: 'json'
      data:
        id: @objectId
      success: (json) =>
        @inspector.html(json.content)
        scrivito.trigger('new_content', @inspector)

      error: =>
        @inspector.empty()

  # Closes the inspector section of the resourcebrowser.
  close: ->
    @inspector.empty()
    @inspector.hide()

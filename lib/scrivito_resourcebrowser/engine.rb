module ScrivitoResourcebrowser
  class Engine < ::Rails::Engine
    isolate_namespace ScrivitoResourcebrowser

    initializer 'scrivito_resourcebrowser.asset_pipeline' do |app|
      app.config.assets.precompile << [
        'scrivito_resourcebrowser.js',
        'scrivito_resourcebrowser.css'
      ]
    end
  end
end

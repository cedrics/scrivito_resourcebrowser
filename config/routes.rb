Rails.application.routes.draw do
  get 'resourcebrowser', to: 'scrivito_resourcebrowser/resourcebrowser#index'
  get 'resourcebrowser/inspector', to: 'scrivito_resourcebrowser/resourcebrowser#inspector'
  get 'resourcebrowser/modal', to: 'scrivito_resourcebrowser/resourcebrowser#modal'
end

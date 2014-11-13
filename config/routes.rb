FortitudeRails::Engine.routes.draw do
  get 'docs', to: 'static#docs'
  get 'component_generator', to: 'static#component_generator'
  get 'customization', to: 'static#customization'
  get 'getting_started', to: 'static#getting_started'
  root to: 'static#index'
end

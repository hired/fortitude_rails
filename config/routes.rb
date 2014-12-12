FortitudeRails::Engine.routes.draw do
  get '/:action', to: 'static', as: :static
  root to: 'static#docs'
end

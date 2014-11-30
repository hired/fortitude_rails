Rails.application.routes.draw do
  get 'home', to: 'home#index'

  mount FortitudeRails::Engine, at: '/fortitude'
end

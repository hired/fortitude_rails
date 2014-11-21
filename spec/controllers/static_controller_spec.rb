require 'spec_helper'

describe FortitudeRails::StaticController do
  routes { FortitudeRails::Engine.routes }
  render_views

  context 'success' do
    after do
      expect(response).to be_ok
    end

    it 'shows docs page' do
      get :docs
    end

    it 'shows component generator page' do
      get :component_generator
    end

    it 'shows customization page' do
      get :customization
    end

    it 'shows getting started page' do
      get :getting_started
    end
  end

end
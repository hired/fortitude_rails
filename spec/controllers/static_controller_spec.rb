require 'spec_helper'

describe FortitudeRails::StaticController do
  routes { FortitudeRails::Engine.routes }
  render_views

  FortitudeRails::StaticController::PAGES.each do |page|
    it "gets #{page}" do
      get page
      expect(response).to be_ok
    end
  end

  context '#docs' do

    it 'renders pages from gem, app, and nested' do
      get :docs
      expect(response).to render_template(partial: 'fortitude_rails/components/_box')
      expect(response).to render_template(partial: 'fortitude_rails/components/_app_specific')
      expect(response).to render_template(partial: 'fortitude_rails/components/nested/_nested_component')
    end
  end

end
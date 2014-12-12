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

end
module FortitudeRails
  module ApplicationHelper
    def theme_intents
      FortitudeRails.theme_intents
    end

    def theme_components
      FortitudeRails.theme_components
    end

    def has_asset?(path)
      Rails.application.assets.find_asset(path) != nil
    end

    def spacer_gif
      'data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7'
    end

    def render_fortitude_component(name)
      render "fortitude_rails/components/#{name}"
    rescue ActionView::MissingTemplate => e
      Rails.logger.error e
      "<h2>#{name} documentation not found.</h2>".html_safe
    end

    def escaped(template)
      output = render(template).to_str
      ::Haml::Helpers.html_escape(output)
    end
  end
end

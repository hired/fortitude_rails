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
      if FortitudeRails.theme_docs[name].present?
        locals = @docs[name]
        locals = locals.merge(name: name) if locals.present?
        locals ||= {name: name}
        locals = locals.with_indifferent_access
        render partial: 'fortitude_rails/static/component_doc', locals: locals
      else
        Rails.logger.error e
        "<h2>#{name} documentation not found.</h2>".html_safe
      end
    end

    def escaped(template)
      output = render(template).to_str
      ::Haml::Helpers.html_escape(output)
    end
  end
end

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

    def render_nav_tree(components, path = '')
      html = ''
      components.each do |name, val|
        name = name.to_s
        component = name[0] == '_' ? name[1..-1] : name
        component = component.split('.').first
        html << "<li><a href='##{component}' class='list-navigation__link'>#{component.titleize}</a>"
        if val.is_a?(Hash)
          html << '<ul class="bare-list bare-list--dotted-line">'
          html << render_nav_tree(val, File.join(path, name))
          html << '</ul>'
        end
      end
      html << "</li>"
      html.html_safe
    end

    def render_component_tree(components, path = '')
      html = ''
      components.each do |name, val|
        name = name.to_s
        if(val.is_a?(Hash))
          html << render_component_tree(val, File.join(path, name))
        else
          component = name[0] == '_' ? name[1..-1] : name
          component = component.split('.').first
          html << "<div class='layout xs-mtb2 xs-mr2' id='#{component}'>"
          html << render(partial: File.join('fortitude_rails', path, component))
          html << '</div>'
        end
      end
      html.html_safe
    end

    def escaped(template)
      output = render(template).to_str
      ::Haml::Helpers.html_escape(output)
    end
  end
end

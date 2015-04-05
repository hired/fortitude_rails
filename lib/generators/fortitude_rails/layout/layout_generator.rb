require 'generators/fortitude_rails/base_generator'
module FortitudeRails
  module Generators
    class LayoutGenerator < BaseGenerator
      source_root File.expand_path('../templates', __FILE__)
      desc 'Generates layout file with a nav bar.'
      argument :layout_name, type: :string, default: 'application'

      def generate_layout
        template "layout.html.#{view_ext}", "app/views/layouts/#{layout_name}.html.#{view_ext}"
      end
    end
  end
end

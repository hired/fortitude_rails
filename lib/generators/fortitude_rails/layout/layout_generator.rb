module FortitudeRails
  module Generators
    class LayoutGenerator < ::Rails::Generators::Base
      source_root File.expand_path('../templates', __FILE__)
      desc 'Generates layout file with a nav bar.'
      argument :layout_name, type: :string, default: 'application'

      def app_name
        @app_name ||= ::Rails.application.class.to_s.split('::').first
      end

      def generate_layout
        template "layout.html.#{view_ext}", "app/views/layouts/#{layout_name}.html.#{view_ext}"
      end

      private

      def view_ext
        @view_ext ||= ::Rails.application.config.generators.options[:rails][:template_engine] || :erb
      end
    end
  end
end

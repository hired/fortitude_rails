module FortitudeRails
  module Generators
    class BaseGenerator < ::Rails::Generators::Base

      def app_name
        @app_name ||= ::Rails.application.class.to_s.split('::').first
      end

      def view_ext
        @view_ext ||= ::Rails.application.config.generators.options[:rails][:template_engine] || :erb
      end
    end
  end
end

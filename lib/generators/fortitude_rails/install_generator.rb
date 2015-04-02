require 'rails/generators/named_base'

module FortitudeRails
  module Generators
    class InstallGenerator < ::Rails::Generators::Base
      desc 'Install style guide scaffolding for Fortitude'
      source_root File.expand_path('../templates', __FILE__)
      argument :name, :type => :string, :default => 'Library'

      def add_library_to_routes
        route "get '/#{file_name}', to: '#{file_name}#show'"
      end

      def create_library_controller
        template 'library_controller.rb.erb', File.join('app', 'controllers', "#{file_name}_controller.rb")
      end

      def create_library_helper
        template 'library_helper.rb.erb', File.join('app', 'helpers', "#{file_name}_helper.rb")
      end

      def create_library_view
        template 'library_show.html.haml', File.join('app', 'views', file_name, 'show.html.haml')
      end

      private

      def file_name
        name.underscore
      end

      def class_name
        name.camelize
      end
    end
  end
end

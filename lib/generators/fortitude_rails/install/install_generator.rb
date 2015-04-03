module FortitudeRails
  module Generators
    class InstallGenerator < ::Rails::Generators::Base
      source_root File.expand_path('../templates', __FILE__)
      argument :name, type: :string, :default => 'Library'
      argument :manifest_name, type: :string, :default => 'application'

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

      def create_fortitude_scss
        template 'base.scss', File.join('app', 'assets', 'stylesheets', 'base.scss')
      end

      def create_directory_structure
        directory 'directory_structure', File.join('app', 'assets', 'stylesheets')
      end

      def require_assets
        require_js
        require_css
      end

      def add_fontawesome_to_gemfile
        gem 'font-awesome-sass'
      end

      def bundle_install
        Bundler.with_clean_env do
          run 'bundle install'
        end
      end

      private

      def file_name
        name.underscore
      end

      def class_name
        name.camelize
      end

      def require_js
        insert_into_file js_manifest, '//= require fortitude\n', after: 'jquery_ujs\n'
      end

      def js_manifest
        "app/assets/javascripts/#{manifest_name}.js"
      end

      def require_css
        if css_manifest_file.match(/require_tree/)
          replace_require_tree_with_require_fortitude
        elsif css_manifest_file.match(/require_self/)
          insert_into_file css_manifest, " *= require base\n", before: " *= require_self"
        else
          say "Please manually add 'require base' to your manifest: #{css_manifest}."
        end
      end

      def css_manifest_file
        @css_manifest_file ||= File.read(css_manifest)
      end

      def css_manifest
        "app/assets/stylesheets/#{manifest_name}.css"
      end

      def replace_require_tree_with_require_fortitude
        path = Rails.root + css_manifest
        temp_file = Tempfile.new('foo')
        begin

          temp_file.puts css_manifest_file.gsub(/require_tree/, 'require fortitude')
          temp_file.close
          FileUtils.mv(temp_file.path, path)
        ensure
          temp_file.close
          temp_file.unlink
        end
        say "Replaced `require_tree` with require fortitude` in #{css_manifest}."
      end
    end
  end
end

module FortitudeRails
  module Configuration
    GEM_PATH = File.expand_path '../..', File.dirname(__FILE__)

    OPTIONS = [
      :theme_components,
      :theme_intents,
      :theme_namespace,
      :app_root,
      :stylesheet,
      :number_of_columns,
      :breakpoint_names,
      :font_sizes
    ]

    attr_accessor *OPTIONS

    def configure
      yield self
    end

    def self.gem_path
      GEM_PATH
    end

    def self.extended(base)
      base.set_default_configuration
    end

    def set_default_configuration
      self.theme_components = doc_pages
      self.theme_intents = %w(
        default
        primary
        success
        info
        warning
        danger
      )

      self.theme_namespace = 'fortitude'
      self.stylesheet = 'application'
      self.breakpoint_names = %w(xs sm md lg)
      self.number_of_columns = 12
      self.font_sizes = {alpha: '3.6rem', beta: '3rem', gamma: '2.4rem',
                         delta: '1.8rem', epsilon: '1.4rem', zeta: '1rem'}
      self
    end

    def gem_path
      GEM_PATH
    end

    def doc_pages
      @doc_pages ||= { 
        'components' => directory_hash(File.join(gem_path, 'app', 'views', 'fortitude_rails', 'components'))
      }
    end

    def app_pages
      return @app_pages if @app_pages
      return {} unless app_root
      if Dir.exists?(File.join(app_root, 'app', 'views', 'fortitude_rails', 'components'))
        @app_pages = { 'components' => directory_hash(Rails.root.join('app', 'views', 'fortitude_rails', 'components')) }
      else
        @app_pages = {}
      end
    end

    OPTIONS.each do |option|
      define_method "#{option}?" do
        self.send(option).present?
      end
    end

    private
      def directory_hash(path, name=nil)
        data = {}
        Dir.foreach(path) do |entry|
          next if (entry == '..' || entry == '.')
          full_path = File.join(path, entry)
          if File.directory?(full_path)
            data[entry] = directory_hash(full_path, entry)
          else
            data[entry] = 'file'
          end
        end
        return data
      end
  end
end

module FortitudeRails
  module Configuration
    GEM_PATH = File.expand_path '../..', File.dirname(__FILE__)

    OPTIONS = [
      :theme_intents,
      :theme_components,
      :theme_namespace,
      :stylesheet
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
      self.theme_components = %w(
        badge
        bare_list
        block_list
        box
        button
        container
        element
        flag
        flashbar
        fluid_container
        form
        inline_list
        layout
        list_navigation
        media
        modal
        navigationbar
        shade
        table
        tabs
        tabs_navigation
        tooltip
        typography
        ui_list
        wings
        utilities
      )

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
      self
    end

    OPTIONS.each do |option|
      define_method "#{option}?" do
        self.send(option).present?
      end
    end
  end
end
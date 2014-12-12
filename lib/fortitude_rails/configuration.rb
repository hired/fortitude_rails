module FortitudeRails
  module Configuration

    OPTIONS = [
      :theme_intents,
      :theme_components,
      :theme_namespace
    ]

    attr_accessor *OPTIONS

    def configure
      yield self
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
        inline-list
        input
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
    end

    OPTIONS.each do |option|
      define_method "#{option}?" do
        self.send(option).present?
      end
    end
  end
end
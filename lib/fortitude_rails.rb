require 'haml-rails'
require 'fortitude_rails/engine'

module FortitudeRails
  mattr_accessor :theme_intents
  mattr_accessor :theme_components

  def self.theme_intents
    @@theme_intents ||= %w(
      default
      primary
      success
      info
      warning
      danger
    )
  end

  def self.theme_components
    @@theme_components ||= %w(
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
  end
end

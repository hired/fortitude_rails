require "fortitude_rails/engine"

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
      bare-list
      block-list
      box
      button
      container
      element
      flag
      flashbar
      fluid-container
      form
      inline-list
      input
      layout
      list-navigation
      media
      modal
      navigationbar
      shade
      table
      tabs
      tabs-navigation
      tooltip
      typography
      ui-list
      wings
      utilities
    )
  end
end

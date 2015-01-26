module FortitudeRails
  class Engine < ::Rails::Engine
    isolate_namespace FortitudeRails
    initializer "my_engine.load_app_root" do |app|
      FortitudeRails.app_root = app.root
      FortitudeRails.theme_components = FortitudeRails.theme_components.deep_merge(FortitudeRails.app_pages)
    end
  end
end

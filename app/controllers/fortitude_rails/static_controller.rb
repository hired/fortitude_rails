class FortitudeRails::StaticController < FortitudeRails::ApplicationController
  PAGES = %w(index docs getting_started customization component_generator full_page)

  PAGES.each do |page|
    define_method page do ; end
  end

end

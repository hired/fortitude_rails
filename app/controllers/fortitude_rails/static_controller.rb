class FortitudeRails::StaticController < FortitudeRails::ApplicationController
  PAGES = %w(index docs getting_started customization component_generator full_page)
  before_action :set_docs

  PAGES.each do |page|
    define_method page do ; end
  end

  private
    def set_docs
      @docs = FortitudeRails.theme_docs
    end

end

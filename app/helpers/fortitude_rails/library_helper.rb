require 'coderay'
module FortitudeRails::LibraryHelper
  SPACER_DATA_URI = 'data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7'.freeze

  def spacer
    SPACER_DATA_URI
  end

  def code_highlight(options = {})
    content = capture_haml { yield }
    content_tag :code, ::CodeRay.scan(content, options[:lang]).html.html_safe, class: ['code--highlight', options[:lang]]
  end

  def library_example(title: nil)
    example_content = {
        mixin: nil,
        html: nil,
        form_builder: nil,
        description: nil
    }

    example = -> (*args) do
      block_name = args.first
      if args.second.is_a? Proc
        haml_block = args.second
        example_content[block_name] = capture_haml { haml_block.call }
      else
        collection = args.second
        haml_block = args.last
        mixin_doc_content = capture_haml { collection.map { |*args| haml_block.call(*args) } }
      end
    end

    example_content[:title] = title
    example_content[:component] = capture_haml { yield(example) }

    render 'fortitude_rails/application/example', example_content
  end
end

# Useful for marking text that needs to be edited in post drafts.

module Jekyll
  class FixmeBlock < Liquid::Block
    def initialize(tag_name, markup, tokens)
      @tag = markup
      super
    end

    def render(context)
      if 'development' == (ENV['JEKYLL_ENV'] || 'development') then
        contents = super
        "<span class='fixme'>#{contents}</span>"
      end
    end
  end
end

Liquid::Template.register_tag("fixme", Jekyll::FixmeBlock)
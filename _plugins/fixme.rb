module Jekyll
  class FixmeBlock < Liquid::Block
    def initialize(tag_name, markup, tokens)
      @tag = markup
      super
    end

    def render(context)
      contents = super

      # pipe param through liquid to make additional replacements possible
      content = Liquid::Template.parse(contents).render context

      "<span class='fixme'>#{contents}</span>"
    end
  end
end

Liquid::Template.register_tag("fixme", Jekyll::FixmeBlock)
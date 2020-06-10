module Jekyll
  class ExtFigureTag < Liquid::Tag

    require "shellwords"

    def initialize(tag_name, text, tokens)
      super
      @text = text.shellsplit
      @assets = @text[0].split(/\s*,\s*/)
    end

    def render(context)
      width = 100 / @assets.length
      imgs = @assets.map {|path| "<img src='"+path+"' alt='#{@text[1]}' width='#{width}%'>"}
      (["<figure>"] + imgs + ["<figcaption>#{@text[1]}</figcaption></figure>"]).join("")
    end
  end
end

Liquid::Template.register_tag('extfigure', Jekyll::ExtFigureTag)


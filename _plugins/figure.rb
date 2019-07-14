module Jekyll
  class FigureTag < Liquid::Tag

    require "shellwords"
    require_relative "asset_path_tag"

    def initialize(tag_name, text, tokens)
      super
      @text = text.shellsplit
      @assets = @text[0].split(/\s*,\s*/)
    end

    def render(context)
      width = 100 / @assets.length
      imgs = @assets.map {|name| "<img src='"+Jekyll.get_default_asset_path(name, context)+"' alt='#{@text[1]}' width='#{width}%'>"}
      (["<figure>"] + imgs + ["<figcaption>#{@text[1]}</figcaption></figure>"]).join("")
    end
  end
end

Liquid::Template.register_tag('figure', Jekyll::FigureTag)


module Jekyll
  class FigureTag < Liquid::Tag

    require "shellwords"
    require_relative "asset_path_tag"

    def initialize(tag_name, text, tokens)
      super
      @text = text.shellsplit
      @asset_paths = @text[0].split(/\s*,\s*/).map { |name| AssetPathTag.new("", name, "") }
      #@asset_path = AssetPathTag.new("", @text[0], "")
    end

    def render(context)
      width = 100 / @asset_paths.length
      imgs = @asset_paths.map {|p| "<img src='"+p.render(context)+"' alt='#{@text[1]}' width='#{width}%'>"}
      (["<figure>"] + imgs + ["<figcaption>#{@text[1]}</figcaption></figure>"]).join("")
    end
  end
end

Liquid::Template.register_tag('figure', Jekyll::FigureTag)


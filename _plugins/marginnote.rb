module Jekyll
  class RenderMarginNoteTag < Liquid::Tag

    require "shellwords"
    require_relative "uuid"

    def initialize(tag_name, text, tokens)
      super
      @text = text.shellsplit
    end

    def render(context)
      id = UUID.create.to_s
      "<span class='marginnote-outer'>"\
      "<span class='marginnote-ref'>#{@text[0]}</span>"\
      "<label for='#{id}' class='margin-toggle'> &#8853;</label>"\
      "<input type='checkbox' id='#{id}' class='margin-toggle'/>"\
      "<span class='marginnote'><span class='marginnote-inner'>#{@text[1]}</span></span>"\
      "</span>"
    end
  end
end

Liquid::Template.register_tag('marginnote', Jekyll::RenderMarginNoteTag)


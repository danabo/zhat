module Jekyll
  class RenderSideNoteTag < Liquid::Tag

    require "shellwords"
    require_relative "uuid"

    def initialize(tag_name, text, tokens)
      super
      @text = text.shellsplit
    end

    def render(context)
      id = UUID.create.to_s
      "<span class='sidenote-ref'>#{@text[0]}</span>"\
      "<label for='#{id}' class='margin-toggle sidenote-number'></label>"\
      "<input type='checkbox' id='#{id}' class='margin-toggle'/>"\
      "<span class='sidenote'>#{@text[1]} </span>"
    end
  end
end

Liquid::Template.register_tag('sidenote', Jekyll::RenderSideNoteTag)


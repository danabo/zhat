module Jekyll
  class RenderSideNoteTag < Liquid::Tag

    require "shellwords"
    require "digest/sha1"

    def initialize(tag_name, text, tokens)
      super
      @text = text.shellsplit
    end

    def render(context)
      id = Digest::SHA1.hexdigest(@text[0]+"|"+@text[1])
      "<span class='sidenote-ref'>#{@text[0]}</span>"\
      "<label for='#{id}' class='margin-toggle sidenote-number'></label>"\
      "<input type='checkbox' id='#{id}' class='margin-toggle'/>"\
      "<span class='sidenote'>#{@text[1]} </span>"
    end
  end
end

Liquid::Template.register_tag('sidenote', Jekyll::RenderSideNoteTag)


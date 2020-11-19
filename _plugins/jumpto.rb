module Jekyll
  class JumpToBlock < Liquid::Block

    require "shellwords"

    def initialize(tag_name, text, tokens)
      super
      @text = text.shellsplit
    end

    def render(context)
      contents = super
      "<a name='#{@text[0]}'></a>"\
      "<span class='jump_to'>#{contents}</span>"
    end
  end
end

Liquid::Template.register_tag('jumpto', Jekyll::JumpToBlock)


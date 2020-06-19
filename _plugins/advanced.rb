## Newthought tag will render anything in the tag with small caps
## Usage {% newthought Your text string here} will render a span
## YOUR TEXT STRING HERE (sort of, you know, small caps) if you are using the tufte.css file

=begin
module Jekyll
  class RenderAdvancedTag < Liquid::Tag

require "shellwords"

    def initialize(tag_name, text, tokens)
      super
      @text = text.shellsplit
    end


    def render(context)
      "<span class='advanced'>#{@text[0]}</span> "
    end
  end
end

Liquid::Template.register_tag('advanced', Jekyll::RenderAdvancedTag)
=end


module Jekyll
  class RenderAdvancedTagBlock < Liquid::Block

    def render(context)
      text = super
      "<span class='advanced outer hidden'><span class='advanced inner hidden'>#{text}</span></span>"
    end

  end
end

Liquid::Template.register_tag('adv', Jekyll::RenderAdvancedTagBlock)

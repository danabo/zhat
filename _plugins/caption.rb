# https://github.com/gettalong/kramdown/issues/593#issuecomment-485260972

class Jekyll::MarkdownCaption < Jekyll::Converters::Markdown
  def convert(content)
      super
        .gsub(/<\/table>\n+<p>Table: (.*?)<\/p>/, '<caption>\1</caption></table>')
  end
end
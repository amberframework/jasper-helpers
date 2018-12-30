require "markdown"

module JasperHelpers::Text
  def render_markdown(markdown)
    Markdown.to_html(markdown)
  end
end

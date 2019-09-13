require "markd"

module JasperHelpers::Text
  def render_markdown(markdown)
    Markd.to_html(markdown)
  end
end

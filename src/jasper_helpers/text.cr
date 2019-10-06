require "markd"

module JasperHelpers::Text
  def render_markdown(markdown : String)
    Markd.to_html(markdown)
  end
end

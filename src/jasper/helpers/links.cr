module Jasper::Helpers::Links

  def link_to(body : String, url : String)
    link_html_string(body, url, {} of Symbol => String)
  end

  def link_to(body : String, url : String, **options : Object)
    link_html_string(body, url, options.to_h)
  end

  def link_to(url : String, &block)
    link_html_string(body: yield, url: url, options: {} of Symbol => String)
  end

  def link_to(url : String, **options : Object, &block)
    link_html_string(body: yield, url: url, options: options.to_h)
  end

  def link_html_string(body : String, url : String, options : Hash(Symbol, String | Bool | Symbol | Int32))
    options = options.map { |k, v| "#{k}=\"#{v}\"" }.join(" ")
    options = " #{options}" if !options.blank?

    "<a href=\"#{url}\"#{options}>#{body}</a>"
  end

end
module Jasper::Helpers::Links

  def link_to(body : String, url : String)
    link_html_string(type: :a, body: body, options: { :href => url })
  end

  def link_to(body : String, url : String, **options : Object)
    link_html_string(type: :a, body: body, options: { :href => url }.merge(options.to_h))
  end

  def link_to(url : String, &block)
    link_html_string(type: :a, body: yield, options: { :href => url })
  end

  def link_to(url : String, **options : Object, &block)
    link_html_string(type: :a, body: yield, options: { :href => url }.merge(options.to_h))
  end

  def link_html_string(type : Symbol, body : String, options : Hash(Symbol, String | Bool | Symbol | Int32))
    options = options.map { |k, v| "#{k}=\"#{v}\"" }.join(" ")
    options = " #{options}" if !options.blank?

    "<#{type}#{options}>#{body}</#{type}>"
  end

  def button_to(body : String, url : String, method = :get, **options : Object)
    form(action: url, class: "button", method: method ) do
      link_html_string(:button, body, options)
    end
  end

  def button_to(body : String, url : String, method = :get)
    form(action: url, class: "button", method: method ) do
      link_html_string(:button, body, {:type => "submit"})
    end
  end

end
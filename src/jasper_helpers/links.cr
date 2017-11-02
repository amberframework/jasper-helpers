module JasperHelpers::Links
  def link_to(body : String, url : String, **options : Object)
    content(element_name: :a, content: body, options: {:href => url}.merge(options.to_h))
  end

  def link_to(body : String, url : String)
    content(element_name: :a, content: body, options: {:href => url})
  end

  def link_to(url : String, &block)
    link_to(yield, url)
  end

  def link_to(url : String, **options : Object, &block)
    link_to(yield, url, **options)
  end

  def button_to(body : String, url : String, method = :post, **options : Object)
    form(action: url, class: "button", method: method) do
      content(:button, body, options)
    end
  end

  def button_to(body : String, url : String, method = :post)
    form(action: url, class: "button", method: method) do
      content(:button, body, {:type => "submit"})
    end
  end

  def button_to(body : String, url : String, method = :post)
    button_content = yield
    form(action: url, class: "button", method: method) do
	  String.build do |str|
	    str << button_content
	    str << content(:button, body, {:type => "submit"})
	  end
    end
  end
end

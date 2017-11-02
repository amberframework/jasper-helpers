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

  def button_to(body : String, url : String, method : Symbol = :post)
    form(action: url, method: method) do
      content(:button, body, {:type => "submit"})
    end
  end

  def button_to(body : String, url : String, method : Symbol = :post)
    form(action: url, method: method) do
      String.build do |str|
        str << yield
        str << content(:button, body, {:type => "submit"})
      end
    end
  end

  def button_to(body : String, url : String, method : Symbol = :post, **options : Object)
    form(action: url, method: method) do
      String.build do |str|
        str << yield
        str << content(:button, body, options.to_h)
      end
    end
  end
end

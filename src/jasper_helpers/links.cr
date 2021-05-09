module JasperHelpers::Links

  # Creates an anchor,`<a />`, tag rendering the `body` parameter as content. The anchor tag's `href` will be set to the `url` parameter provided. The `options` parameter is be used to provide additional configurations or attributes for the tag.
	# 
	# Example:
	# ```
	#  link_to("Go to GitHub", "http://github.com", { id: "github-url" })
	# ```
	# 
	# Produces:
	# ```
	#  <a href="http://github.com" id="github-url">Go to GitHub</a>
	# ```
  def link_to(body : String, url : String, **options : Object)
    content(element_name: :a, content: body, options: {:href => url}.merge(options.to_h))
  end

	# :ditto:
	#
	# With the exception of not accepting tag options
  def link_to(body : String, url : String)
    content(element_name: :a, content: body, options: {:href => url})
  end

	# Creates an anchor,`<a />`, tag with the `href` attribute set to the `url` parameter provided.
	# The `options` parameter can be used to provide additional configurations or attributes for the tag.
	# 
	# Example:
	# ```
	#  link_to("http://github.com", { id: "github-url" })
	# ```
	# 
	# Produces:
	# ```
	#  <a href="http://github.com" id="github-url"/>
	# ```
  def link_to(url : String, **options : Object, &block)
    link_to(yield, url, **options)
  end

	# :ditto:
	#
	# With the exception of not accepting tag options
  def link_to(url : String, &block)
    link_to(yield, url)
  end

  def button_to(body : String, url : String, method : Symbol = :post)
    form(action: url, method: method) do
      content(element_name: :button, content: body, options: {:type => "submit"})
    end
  end

  def button_to(body : String, url : String, method : Symbol = :post)
    form(action: url, method: method) do
      String.build do |str|
        str << yield
        str << content(element_name: :button, content: body, options: {:type => "submit"})
      end
    end
  end

  def button_to(body : String, url : String, method : Symbol = :post, **options : Object)
    form(action: url, method: method) do
      content(element_name: :button, content: body, options: options.to_h)
    end
  end

  def button_to(body : String, url : String, method : Symbol = :post, **options : Object, &block)
    form(action: url, method: method) do
      String.build do |str|
        str << yield
        str << content(element_name: :button, content: body, options: options.to_h)
      end
    end
  end
end

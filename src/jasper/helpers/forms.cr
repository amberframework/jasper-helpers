module Jasper::Helpers::Forms
  # text_field
  def text_field(name : String | Symbol, **options : Object)
    options = options.to_h
    input_field(type: :text, options: {:name => name, :id => name}.merge(options))
  end

  def text_field(name : String | Symbol)
    input_field(type: :text, options: {:name => name, :id => name})
  end

  def label(name : String | Symbol, content : String? = nil, **options : Object)
    content(element_name: :label, content: (content ? content : name.to_s.capitalize), options: {:for => name, :id => "#{name}_label"}.merge(options.to_h))
  end

  def label(name : String | Symbol, content : String? = nil)
    label(name, content: (content ? content : name.to_s.capitalize), for: name, id: "#{name}_label")
  end

  # def csrf_field
  #   hidden_field(name: "authenticity_token", value: "")
  # end

  # form
  def form(method = :post, **options : Object, &block)
    options_hash = options.to_h.merge({:method => (method == :get ? :get : :post)})
    content(element_name: :form, options: options_hash) do
      String.build do |str|
        str << hidden_field(name: "_method", value: method) if method != :post
        # str << csrf_field
        str << yield
      end
    end
  end
  
  def form(method = :post, &block)
    form(:post, class: "amber_form", &block)
  end

  # hidden_field
  def hidden_field(name : String | Symbol, **options : Object)
    input_field(type: :hidden, options: {:name => name, :id => name}.merge(options.to_h))
  end

  def hidden_field(name : String | Symbol)
    hidden_field(name: name, id: name)
  end

  # select_field
  # with collection Array(Array)
  def select_field(name : String | Symbol, collection : Array(Array), **options : Object)
    content(element_name: :select, options: options.to_h.merge({:name => name})) do
      collection.map { |item| "<option value=\"#{item[0]}\">#{item[1]}</option>" }.join("")
    end
  end

  # Utilizes method above for when options are not defined and sets class and id.
  def select_field(name : String | Symbol, collection : Array(Array))
    select_field(name, collection, class: name, id: name)
  end

  # with collection Array(Hash)
  def select_field(name : String | Symbol, collection : Array(Hash), **options : Object)
    select_field(name, collection.map(&.first.to_a), **options)
  end

  def select_field(name : String | Symbol, collection : Array(Hash))
    select_field(name, collection.map(&.first.to_a), class: name, id: name)
  end

  # with collection Array
  def select_field(name : String | Symbol, collection : Array | Range, **options : Object)
    select_field(name, collection.map { |i| [i.to_s, i.to_s.capitalize] }, **options)
  end

  def select_field(name : String | Symbol, collection : Array | Range)
    select_field(name, collection.map { |i| [i.to_s, i.to_s.capitalize] }, class: name, id: name)
  end

  # text_area
  def text_area(name : String | Symbol, content : String, **options : Object)
    options_hash = Hash(Symbol, String | Symbol).new.merge(options.to_h)
    options_hash[:cols], options_hash[:rows] = options_hash.delete(:size).to_s.split("x") if options.has_key?(:size)
    content(element_name: :textarea, options: {:name => name, :id => name}.merge(options_hash)) do
      content
    end
  end

  def text_area(name : String | Symbol, content : String)
    text_area(name, content, id: name)
  end

  # submit
  def submit(**options : Object)
    input_field(type: :submit, options: options.to_h)
  end

  def submit(value : String | Symbol, **options : Object)
    input_field(type: :submit, options: {:value => value.to_s.capitalize}.merge(options.to_h))
  end

  def submit(value : String | Symbol = "Save changes")
    submit(value: value.to_s.capitalize)
  end

  # check_box
  def check_box(name : String | Symbol, checked_value = "1", unchecked_value = "0", **options : Object)
    options_hash = Hash(Symbol, String | Symbol).new.merge({:name => name, :id => name, :value => checked_value})
    String.build do |str|
      str << hidden_field(name, value: unchecked_value)
      str << input_field(type: :checkbox, options: options_hash.merge(options.to_h))
    end
  end

  def check_box(name : String | Symbol, checked_value = "1", unchecked_value = "0")
    check_box(name, checked_value: checked_value, unchecked_value: unchecked_value, id: name)
  end
end

module Jasper::Helpers::Forms
  # text_field
  def text_field(**options : Object)
    options = options.to_h
    input_field(type: :text, options: options)
  end

  def text_field(name : String | Symbol, **options : Object)
    options = options.to_h

    input_field(type: :text, options: {:name => name, :id => name}.merge(options))
  end

  def text_field(name : String | Symbol)
    input_field(type: :text, options: {:name => name, :id => name})
  end

  # label
  def label(**options : Object)
    options = options.to_h

    name = options[:name]
    content = options[:content]

    content(element_name: :label, content: content, options: {:for => name, :id => "#{name}_label"}.merge(options))
  end

  def label(name : String | Symbol, content : String, **options : Object)
    options = options.to_h

    content(element_name: :label, content: content, options: {:for => name, :id => "#{name}_label"}.merge(options))
  end

  def label(name : String | Symbol, content : String)
    content(element_name: :label, content: content, options: {:for => name, :id => "#{name}_label"})
  end

  def csrf_field
    hidden_field(name: "authenticity_token", value: "")
  end

  # form
  def form(method = :post, **options : Object, &block)
    options = options.to_h

    options[:method] = "post"

    content(element_name: :form, options: options) do
      String.build do |str|
        str << hidden_field(type: "_method", value: method) if method != :post
        str << csrf_field
        str << yield
      end
    end
  end

  # hidden_field
  def hidden_field(**options : Object)
    options = options.to_h
    input_field(type: :hidden, options: options)
  end

  def hidden_field(name : String | Symbol, **options : Object)
    options = options.to_h
    input_field(type: :text, options: {:name => name, :id => name}.merge(options))
  end

  def hidden_field(name : String | Symbol)
    input_field(type: :hidden, options: {:name => name, :id => name})
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
    options_hash = {} of Symbol => String | Symbol | Int32

    options_hash.merge!(options.to_h)

    if options_hash.has_key?(:size) # cols by rows
      options_hash[:cols], options_hash[:rows] = options_hash[:size].to_s.split("x")
      options_hash.reject!(:size)
    end

    options_hash.merge!({:name => name, :id => name})

    content(element_name: :textarea, options: options_hash) do
      content
    end
  end

  def text_area(name : String | Symbol, content : String)
    content(element_name: :textarea, options: {:name => name, :id => name}) do
      content
    end
  end

  # submit
  def submit(**options : Object)
    options = options.to_h

    input_field(type: :submit, options: options)
  end

  def submit(value : String | Symbol, **options : Object)
    options = options.to_h

    options[:value] = value.to_s.capitalize

    input_field(type: :submit, options: options)
  end

  def submit(value = "Save changes")
    options = {:value => value.to_s.capitalize}

    input_field(type: :submit, options: options)
  end

  # check_box
  def check_box(name : String | Symbol, value = "1", checked = false, **options : Object)
    options = options.to_h

    options[:value] = value
    options[:checked] = checked

    input_field(type: :checkbox, options: options.merge(name: name))
  end

  def check_box(name : String | Symbol, value = "1", checked = false)
    options = {:name => name, :id => name, :value => value, :checked => checked}

    input_field(type: :checkbox, options: options)
  end
end

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

    content(name: :label, content: content, options: {:for => name, :id => "#{name}_label"}.merge(options))
  end

  def label(name : String | Symbol, content : String, **options : Object)
    options = options.to_h

    content(name: :label, content: content, options: {:for => name, :id => "#{name}_label"}.merge(options))
  end

  def label(name : String | Symbol, content : String)
    content(name: :label, content: content, options: {:for => name, :id => "#{name}_label"})
  end

  # form
  def form(**options : Object, method = :post, &block)
    options = options.to_h

    options.delete(:method)

    content(name: :form, options: options.merge({:method => :post})) do
       String.build do |str|
         str << hidden_field(type: "_method", value: method ) if method != :post
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
    content(name: :select, options: options.to_h) do
      collection.map{ |item| "<option value=\"#{item[0]}\">#{item[1]}</option>"}.join("")
    end
  end

  def select_field(name : String | Symbol, collection : Array(Array))
    content(name: :select, options: {:name => name, :id => name}) do
      collection.map{ |item| "<option value=\"#{item[0]}\">#{item[1]}</option>"}.join("")
    end
  end

  # with collection Array(Hash)
  def select_field(name : String | Symbol, collection : Array(Hash), **options : Object)
    content(name: :select, options: options.to_h) do
      collection.map{ |hash| "<option value=\"#{hash.first[0]}\">#{hash.first[1]}</option>"}.join("")
    end
  end

  def select_field(name : String | Symbol, collection : Array(Hash))
    content(name: :select, options: {:name => name, :id => name}) do
      collection.map{ |hash| "<option value=\"#{hash.first[0]}\">#{hash.first[1]}</option>"}.join("")
    end
  end

  # with collection Array
  def select_field(name : String | Symbol, collection : Array, **options : Object)
    content(name: :select, options: options.to_h) do
      collection.map{ |item| "<option>#{item}</option>"}.join("")
    end
  end

  def select_field(name : String | Symbol, collection : Array)
    content(name: :select, options: {:name => name, :id => name}) do
      collection.map{ |item| "<option>#{item}</option>"}.join("")
    end
  end

  # with range Range
  def select_field(name : String | Symbol, range : Range, **options : Object)
    collection = range.to_a

    content(name: :select, options: options.to_h) do
      collection.map{ |item| "<option>#{item}</option>"}.join("")
    end
  end

  def select_field(name : String | Symbol, range : Range)
    collection = range.to_a

    content(name: :select, options: {:name => name, :id => name}) do
      collection.map{ |item| "<option>#{item}</option>"}.join("")
    end
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

    content(name: :textarea, options: options_hash) do
      content
    end
  end

  def text_area(name : String | Symbol, content : String)
    content(name: :textarea, options: {:name => name, :id => name}) do
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
    options = { :value => value.to_s.capitalize }

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

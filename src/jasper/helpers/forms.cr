module Jasper::Helpers::Forms

  def text_field_tag(**options)
    options = options.to_h

    input_field_tag(type: :text, options: options)
  end

  def label_tag(content : String, **options)
    options = options.to_h

    content_tag(name: :label, content: content, options: options)
  end

  def form_tag(**options, &block)
    content_tag(name: :form, options: options.to_h) do
      yield
    end
  end

  def hidden_field_tag(**options)
    options = options.to_h

    input_field_tag(type: :hidden, options: options)
  end

  def select_tag(collection : Array(Array), **options)
    content_tag(name: :select, options: options.to_h) do
      collection.map{ |item| "<option value=\"#{item[0]}\">#{item[1]}</option>"}.join("")
    end
  end

  def select_tag(collection : Array, **options)
    content_tag(name: :select, options: options.to_h) do
      collection.map{ |item| "<option>#{item}</option>"}.join("")
    end
  end

  def text_area_tag(content : String, **options)
    options = options.to_h

    if options.has_key?(:size) # cols by rows
      options[:cols], options[:rows] = options[:size].to_s.split("x")
      options.reject!(:size)
    end

    content_tag(name: :textarea, options: options.to_h) do
      content
    end
  end

  def submit_tag(**options : Object)
    options = options.to_h

    input_field_tag(type: :submit, options: options)
  end

  def submit_tag(value = "Save changes")
    options = { :value => value }

    input_field_tag(type: :submit, options: options)
  end

end

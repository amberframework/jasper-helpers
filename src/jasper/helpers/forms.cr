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

end

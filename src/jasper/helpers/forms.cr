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

end

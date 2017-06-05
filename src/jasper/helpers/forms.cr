module Jasper::Helpers::Forms

  def text_field_tag(**options)
    options = options.to_h

    input_field_tag(type: :text, options: options)
  end

  def label_tag(**options)
    options = options.to_h

    content = options[:content]

    options.reject!([:content])

    content_tag(name: :label, content: content, options: options)
  end

end

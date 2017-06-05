module Jasper::Helpers::Tags

  INPUT_BOOLEAN_ATTRIBUTES = [:disabled]

  def input_field_tag(type : Symbol, **options)
    options_hash = options.to_h
    input_field_tag_string(type: type, options: options_hash)
  end

  def input_field_tag(type : Symbol, options : Hash(String | Symbol, String | Bool | Symbol))
    input_field_tag_string(type: type, options: options)
  end

  def input_field_tag_string(type : Symbol, options : Hash(String | Symbol, String | Bool | Symbol))
    boolean_options = options.select(INPUT_BOOLEAN_ATTRIBUTES)

    tag_options = options.reject!(INPUT_BOOLEAN_ATTRIBUTES).map { |k, v| "#{k}=\"#{v}\"" }
    tag_options = tag_options << boolean_options.keys.join(" ") if !boolean_options.empty?
    tag_options = tag_options.join(" ")

    "<input type=\"#{type}\" #{tag_options}/>"
  end

  def content_tag(name : Symbol, content : String, options : Hash(String | Symbol, String | Bool | Symbol) )
    content_tag(name: name, options: options) do
      content
    end
  end

  def content_tag(name : Symbol, options : Hash(String | Symbol, String | Bool | Symbol), &block)
    options = options.map { |k, v| "#{k}=\"#{v}\"" }.join(" ")
    options = " #{options}" if !options.blank?

    "<#{name}#{options}>#{yield}</#{name}>"
  end

end

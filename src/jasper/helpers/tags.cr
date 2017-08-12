module Jasper::Helpers::Tags
  INPUT_BOOLEAN_ATTRIBUTES = [:disabled]

  def input_field(type : Symbol, **options)
    options = options.to_h
    input_field_string(type: type, options: options)
  end

  def input_field(type : Symbol, options : Hash(Symbol, String | Bool | Symbol | Int32))
    input_field_string(type: type, options: options)
  end

  def input_field_string(type : Symbol, options : Hash(Symbol, String | Bool | Symbol | Int32))
    tag_options = prepare_input_field_options(options: options)

    "<input type=\"#{type}\" #{tag_options}/>"
  end

  # helper for input field options
  def prepare_input_field_options(options : Hash(Symbol, String | Bool | Symbol | Int32))
    # set id and name to name if specified and no id provided
    options[:id] = options[:name] if (options[:name]?) && !(options[:id]?)

    boolean_options = options.select(INPUT_BOOLEAN_ATTRIBUTES)

    tag_options = options.reject!(INPUT_BOOLEAN_ATTRIBUTES).map { |k, v| "#{k}=\"#{v}\"" }
    tag_options = tag_options << boolean_options.keys.join(" ") if !boolean_options.empty?
    tag_options = tag_options.join(" ")

    tag_options
  end

  def content(element_name : Symbol, content : String, options : Hash(Symbol, String | Bool | Symbol | Int32))
    content(element_name: element_name, options: options) do
      content
    end
  end

  def content(element_name : Symbol, options : Hash(Symbol, String | Bool | Symbol | Int32), &block)
    options = options.map { |k, v| "#{k}=\"#{v}\"" }.join(" ")
    options = " #{options}" if !options.blank?

    "<#{element_name}#{options}>#{yield}</#{element_name}>"
  end
end

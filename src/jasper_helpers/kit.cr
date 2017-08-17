module JasperHelpers::Kit
  extend self

  def css_safe(value)
    value.to_s.gsub(/[^\w-]/, " ").strip.gsub(/\s+/, "_").downcase
  end

  def merge(*options)
    options.reduce(OptionHash.new) do |h, opts|
      h.merge!(opts.to_h)
    end
  end

  def sanitize(options : OptionHash)
    options[:id] = css_safe(options[:id]) if options[:id]?
    options[:class] = css_safe(options[:class]) if options[:class]?
    options
  end
  
  def safe_hash(*options)
    sanitize(merge(*options))
  end
end

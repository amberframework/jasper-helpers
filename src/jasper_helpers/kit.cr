module JasperHelpers::Kit
  extend self

  def css_safe(value)
    values = value.to_s.strip.split(' ')
    values.map { |v| v.gsub(/[^\w-]+/, " ").strip.gsub(/\s+/, "_") }.join(' ')
  end

  def merge(*options)
    options.reduce(OptionHash.new) do |h, opts|
      h.merge!(opts.to_h)
    end
  end

  def sanitize(options : OptionHash)
    name = options[:name]?.to_s
    [:id, :class].each do |k|
      next if (v = options[k]?.to_s).empty?
      v = v.gsub(" ", "_").downcase if v == name
      options[k] = css_safe(v)
    end
    options
  end

  def safe_hash(*options)
    sanitize(merge(*options))
  end
end

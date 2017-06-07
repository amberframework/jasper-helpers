class Jasper::Form

  def text_field(name : Symbol)

    # if has_property?(name)
    #   puts "Responds to #{name}"
    # end
    #
    puts has_property?(name)
  end

  # def assert_responds_to(obj, mthd)
  #   return true if obj.respond_to?(mthd)
  #   raise %{Expected #{obj} to respond to :"#{mthd}", not #{ obj }}
  # end

end

macro has_property?(variable)
  self.responds_to?(:{{variable}})
end

require "../spec_helper"

describe Jasper::Form do
  describe "create" do

    example_form = ExampleForm.new

    example_form.text_field(:title)
    example_form.text_field(:not_exist)

    puts "title #{example_form.title} #{example_form.responds_to?(:title)}"

  end
end
require "../../spec_helper"

describe Jasper::Helpers::Forms do
  describe "#text_field_tag" do
    it "id value works" do
      text_field_tag(id: "my-great-text-input").should eq("<input type=\"text\" id=\"my-great-text-input\">")
    end

    it "style value works" do
      text_field_tag(style: "color: white;").should eq("<input type=\"text\" style=\"color: white;\">")
    end
  end

  describe "#label_tag" do
    it "for sets the tag with content" do
      label_tag(for: "my-great-text-input", content: "My Label").should eq("<label for=\"my-great-text-input\">My Label</label>")
    end

    it "for sets the tag with content and class" do
      label_tag(for: "my-great-text-input", content: "My Label", class: "label").should eq("<label for=\"my-great-text-input\" class=\"label\">My Label</label>")
    end
  end

  describe "#form_tag" do
    result = form_tag(id: "myForm") do
      text_field_tag(id: "my-great-text-input")
    end

    result.should eq("<form id=\"myForm\"><input type=\"text\" id=\"my-great-text-input\"></form>")
  end
end

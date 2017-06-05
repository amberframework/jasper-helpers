require "../../spec_helper"

describe Jasper::Helpers::Forms do
  describe "#text_field_tag" do
    it "id value works" do
      text_field_tag(id: "my-great-text-input").should eq("<input type=\"text\" id=\"my-great-text-input\"/>")
    end

    it "style value works" do
      text_field_tag(style: "color: white;").should eq("<input type=\"text\" style=\"color: white;\"/>")
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
    it "allows for nested input fields" do
      result = form_tag(id: "myForm") do
        text_field_tag(id: "my-great-text-input")
      end

      result.should eq("<form id=\"myForm\"><input type=\"text\" id=\"my-great-text-input\"/></form>")
    end
  end

  describe "#hidden_field_tag" do
    it "creates a hidden field" do
      hidden_field_tag(id: "my-hidden-field").should eq("<input type=\"hidden\" id=\"my-hidden-field\"/>")
    end
  end

  describe "#select_tag" do
    it "creates a select_tag with two dimension arrays" do
      select_tag(id: "my-select-field", collection: [[1, "A"],[2, "B"]]).should eq("<select id=\"my-select-field\"><option value=\"1\">A</option><option value=\"2\">B</option></select>")
    end

    it "creates a select_tag with single dimension array" do
      select_tag(id: "my-select-field", collection: ["A", "B"]).should eq("<select id=\"my-select-field\"><option>A</option><option>B</option></select>")
    end
  end

  describe "#text_area_tag" do
    it "creates a text_area_tag" do
      text_area_tag(id: "my-textarea", content: "My Great Textarea").should eq("<textarea id=\"my-textarea\">My Great Textarea</textarea>")
    end

    it "allows for rows and cols to be specified" do
      text_area_tag(id: "my-textarea", content: "My Great Textarea", cols: 5, rows: 10).should eq("<textarea id=\"my-textarea\" cols=\"5\" rows=\"10\">My Great Textarea</textarea>")
    end
  end

end

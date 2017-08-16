require "../../spec_helper"

describe Jasper::Helpers::Forms do
  describe "#text_field" do
    it "main param works with string" do
      text_field("my-great-text-input").should eq("<input type=\"text\" name=\"my-great-text-input\" id=\"my-great-text-input\"/>")
    end

    it "main param works with symbol" do
      text_field(:name).should eq("<input type=\"text\" name=\"name\" id=\"name\"/>")
    end

    it "style value works" do
      text_field(:name, style: "color: white;").should eq("<input type=\"text\" name=\"name\" id=\"name\" style=\"color: white;\"/>")
    end
  end

  describe "#label" do
    it "creates with string" do
      label("name", "My Label").should eq("<label for=\"name\" id=\"name_label\">My Label</label>")
    end

    it "creates with symbol" do
      label(:name, "My Label").should eq("<label for=\"name\" id=\"name_label\">My Label</label>")
    end

    it "creates with string and options" do
      label(:name, "My Label", class: "label").should eq("<label for=\"name\" id=\"name_label\" class=\"label\">My Label</label>")
    end
  end

  describe "#form" do
    it "allows for nested input fields" do
      result = form(id: "myForm") do
        text_field(:name)
      end

      result.should eq("<form id=\"myForm\" method=\"post\"><input type=\"text\" name=\"name\" id=\"name\"/></form>")
    end
  end

  describe "#hidden_field" do
    it "creates a hidden field" do
      hidden_field(:token).should eq("<input type=\"hidden\" name=\"token\" id=\"token\"/>")
    end
  end

  describe "#select_field" do
    it "creates a select_field with two dimension arrays" do
      select_field(:age, [[1, "A"], [2, "B"]]).should eq("<select class=\"age\" id=\"age\" name=\"age\"><option value=\"1\">A</option><option value=\"2\">B</option></select>")
    end

    it "creates a select_field with array of hashes" do
      select_field(:age, [{:"1" => "A"}, {:"2" => "B"}]).should eq("<select class=\"age\" id=\"age\" name=\"age\"><option value=\"1\">A</option><option value=\"2\">B</option></select>")
    end

    it "creates a select_field with single dimension array" do
      select_field(:age, ["A", "B"]).should eq("<select class=\"age\" id=\"age\" name=\"age\"><option value=\"A\">A</option><option value=\"B\">B</option></select>")
    end

    it "creates a select_field with range" do
      select_field(:age, collection: 1..5).should eq("<select class=\"age\" id=\"age\" name=\"age\"><option value=\"1\">1</option><option value=\"2\">2</option><option value=\"3\">3</option><option value=\"4\">4</option><option value=\"5\">5</option></select>")
    end
  end

  describe "#text_area" do
    it "creates a text_area" do
      text_area(:description, "My Great Textarea").should eq("<textarea name=\"description\" id=\"description\">My Great Textarea</textarea>")
    end

    it "allows for rows and cols to be specified" do
      text_area(:description, "My Great Textarea", cols: 5, rows: 10).should eq("<textarea name=\"description\" id=\"description\" cols=\"5\" rows=\"10\">My Great Textarea</textarea>")
    end

    it "allows for size to be specified" do
      text_area(:description, "My Great Textarea", size: "5x10").should eq("<textarea name=\"description\" id=\"description\" cols=\"5\" rows=\"10\">My Great Textarea</textarea>")
    end
  end

  describe "#submit" do
    it "creates a submit with no parameters" do
      submit.should eq("<input type=\"submit\" value=\"Save changes\"/>")
    end

    it "creates a submit with value parameter" do
      submit(:create).should eq("<input type=\"submit\" value=\"Create\"/>")
    end

    it "creates a submit with value and id parameters" do
      submit(:create, id: "my-submit-tag").should eq("<input type=\"submit\" value=\"Create\" id=\"my-submit-tag\"/>")
    end
  end

  describe "#check_box" do
    it "creates a check_box with only value" do
      check_box(:allowed, checked_value: "yes", unchecked_value: "no").should eq("<input type=\"hidden\" name=\"allowed\" id=\"allowed\" value=\"no\"/><input type=\"checkbox\" name=\"allowed\" id=\"allowed\" value=\"yes\"/>")
    end

    it "marks box as checked" do
      check_box(:allowed, checked_value: "yes", unchecked_value: "no", checked: true).should eq("<input type=\"hidden\" name=\"allowed\" id=\"allowed\" value=\"no\"/><input type=\"checkbox\" name=\"allowed\" id=\"allowed\" value=\"yes\" checked=\"checked\"/>")
    end
  end
end

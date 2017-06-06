require "../../spec_helper"

describe Jasper::Helpers::Tags do
  describe "#input_field" do
    it "id value works" do
      input_field(type: :text, id: "my-great-input").should eq("<input type=\"text\" id=\"my-great-input\"/>")
    end

    it "id value inside of options hash" do
      input_field(type: :text, options: { :id => "my-great-input" }).should eq("<input type=\"text\" id=\"my-great-input\"/>")
    end

    it "name value works" do
      input_field(type: :text, name: "my-great-input").should eq("<input type=\"text\" name=\"my-great-input\" id=\"my-great-input\"/>")
    end

    it "disabled true only has key, not value" do
      input_field(type: :text, disabled: true).should eq("<input type=\"text\" disabled/>")
    end
  end

  describe "#content" do
    it "accepts a content string" do
      content(name: :span, options: { :id => "bar" }, content: "Hello").should eq("<span id=\"bar\">Hello</span>")
    end

    it "accepts a block as input" do
      result = content(name: :div, options: { :id => "foo" }) do
        content(name: :span, options: { :id => "bar" }, content: "Hello")
      end

      result.should eq("<div id=\"foo\"><span id=\"bar\">Hello</span></div>")
    end

  end
end

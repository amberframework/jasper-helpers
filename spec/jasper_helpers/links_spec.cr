require "../../spec_helper"

describe JasperHelpers::Links do
  describe "#link_to" do
    it "works with body and url provided" do
      link_to("Save", "/save").should eq("<a href=\"/save\">Save</a>")
    end

    it "works with a block" do
      result = link_to("/save") do
        "<span class=\"label\">Badge</span>"
      end

      result.should eq("<a href=\"/save\"><span class=\"label\">Badge</span></a>")
    end

    it "works with a class" do
      link_to("Save", "/save", class: "my-link").should eq("<a href=\"/save\" class=\"my-link\">Save</a>")
    end
  end

  describe "#button_to" do
    it "works with body and url provided" do
      button_to("Save", "/save").should eq("<form action=\"/save\" class=\"button\" method=\"post\"><button type=\"submit\">Save</button></form>")
    end

    it "changes the method when provided" do
      button_to("Save", "/save", :put).should eq button_to_no_block
    end

    context "with block" do
      it "renders form with hidden field" do
        form = button_to("Save", "/save", :delete) do
          hidden_field(:_csrf, value: "some value")
        end

        form.should eq button_to_with_block
      end

      it "renders form with hidden field" do
        form = button_to("Save", "/save", :delete) do
          hidden_field(:_csrf, value: "some value") + %(Random text)
        end

        form.should eq button_to_with_block_random_text
      end
    end
  end
end

def button_to_no_block
  <<-FORM
  <form action="save" class="button" method="post">
  <input type="hidden" name="_method" id="_method" value="put"/>
  <button type="submit">Save</button>
  </form>
  FORM
end

def button_to_with_block
  <<-FORM
  <form action="/save" class="button" method="post">\
  <input type="hidden" name="_method" id="_method" value="delete"/>\
  <input type="hidden" name="_csrf" id="_csrf" value="some value"/>\
  <button type="submit">Save</button>\
  </form>
  FORM
end

def button_to_with_block_random_text
  <<-FORM
  <form action="/save" class="button" method="post">\
  <input type="hidden" name="_method" id="_method" value="delete"/>\
  <input type="hidden" name="_csrf" id="_csrf" value="some value"/>\
  Random text\
  <button type="submit">Save</button>\
  </form>
  FORM
end

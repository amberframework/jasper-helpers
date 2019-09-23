require "../spec_helper"

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
      button_to("Save", "/save").should eq expected_form
    end

    it "changes the method when provided" do
      button_to("Save", "/save", :put).should eq expected_form(override_method: :put)
    end

    context "with block" do
      it "renders form with hidden field" do
        form = button_to("Save", "/save", :delete) do
          hidden_field(:_csrf, value: "some value")
        end

        form.should eq expected_form(hidden_field(:_csrf, value: "some value"), :delete)
      end

      it "renders form with hidden field" do
        form = button_to("Save", "/save", :delete) do
          hidden_field(:_csrf, value: "some value") + %(Random text)
        end

        form.should eq expected_form(
          hidden_field(:_csrf, value: "some value") + %(Random text), :delete
        )
      end

      it "renders form with hidden field and styled button" do
        form = button_to("Save", "/save", :delete, type: "button", class: "btn btn-primary") do
          hidden_field(:_csrf, value: "some value") + %(Random text)
        end

        form.should eq expected_form(
          hidden_field(:_csrf, value: "some value") + %(Random text),
          :delete,
          "btn btn-primary",
          "button"
        )
      end
    end
  end
end

def expected_form(content = "", override_method = nil, css_class = nil, type = "submit")
  <<-FORM
  <form action="/save" method="post">#{%(<input type="hidden" name="_method" id="_method" value="#{override_method}"/>) if override_method}#{content}\
  <button type="#{type}"#{%( class="#{css_class}") if css_class}>Save</button>\
  </form>
  FORM
end

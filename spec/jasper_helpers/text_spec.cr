require "../spec_helper"

describe JasperHelpers::Text do
  describe "#render_markdown" do
    it "returns html from markdown" do
      expected = "<h1>Hello world</h1>"
      render_markdown("# Hello world").should eq(expected)
    end
  end
end

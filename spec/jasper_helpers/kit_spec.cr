require "../spec_helper"

describe JasperHelpers::Kit do
  describe "#css_safe" do
    it "creates safe id from bracketed name" do
      Kit.css_safe("test[name]").should eq("test_name")
    end

    it "shouldn't put more than underscores in a row or have ending or leading underscores" do
      Kit.css_safe(" david[bowie!]{rules}").should eq("david_bowie_rules")
    end
  end

  describe "merging and sanitizing" do
    it "it merges hash and namedtuple together in the right order" do
      expected = {:name => "kalidan[storm_blessed]", :age => 22, :id => "oath[bringer]", :selected => "syl"}
      Kit.merge({:name => "kalidan[storm_blessed]", :age => 22}, {id: "oath[bringer]", selected: "syl"}).should eq(expected)
    end

    it "it merges and sanitizes params" do
      expected = {:name => "dragon[reborn]", :age => 22, :class => "rand al thor", :selected => "sidar"}
      Kit.safe_hash({:name => "dragon[reborn]", :age => 22}, {class: "rand 'al thor", selected: "sidar"}).should eq(expected)
    end

    it "it sanitizes id and class" do
      expected = {:name => "kalidan[storm_blessed]", :age => 22, :id => "oath_bringer"}
      Kit.sanitize({:name => "kalidan[storm_blessed]", :age => 22, :id => "oath[bringer]"}).should eq(expected)
    end
  end
end

require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef", name: "Boyardee") }
  let(:brownie) { Dessert.new("brownie", 50, chef) }

  describe "#initialize" do
    it "sets a type" do
      expect(brownie.type).to eq("brownie")
    end

    it "sets a quantity" do
      expect(brownie.quantity).to eq(50)
    end

    it "starts ingredients as an empty array" do
      expect(brownie.ingredients).to be_empty
    end

    it "raises an argument error when given a non-integer quantity" do
      expect { Dessert.new("brownie", "five", chef) }.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      brownie.add_ingredient("brown")
      expect(brownie.ingredients).to include("brown")
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      ingredients = %w[sugar eggs milk love]
      ingredients.each { |thing| brownie.add_ingredient(thing) }
      expect(brownie.ingredients).to eq(ingredients)
      brownie.mix!
      expect(brownie.ingredients).not_to eq(ingredients)
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      brownie.eat(10)
      expect(brownie.quantity).to eq(40)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect { brownie.eat(100) }.to raise_error("not enough left!")
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      allow(chef).to receive(:titleize).and_return("Chef Boyardee the Great Baker")
      expect(brownie.serve).to eq("Chef Boyardee the Great Baker has made 50 brownies!")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      allow(chef).to receive(:bake).with(brownie)
      brownie.make_more
    end
  end
end

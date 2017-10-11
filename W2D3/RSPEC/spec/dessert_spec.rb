require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:lemonbar) { Dessert.new("lemonbar", 10, chef) }
  let(:chef) { double("chef", name: "William") }

  describe "#initialize" do
    it "sets a type" do
      expect(lemonbar.type).to eq("lemonbar")
    end


    it "sets a quantity" do
      expect(lemonbar.quantity).to eq(75)
    end

    it "starts ingredients as an empty array" do
      expect(lemonbar.ingredients).to eq([])
    end


    it "raises an argument error when given a non-integer quantity" do
      expect { Desserts.new("lemonbar", "ten") }.to raise_error("Fatal error")
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      lemonbar.add_ingredient("lemon zest")
      expect(lemonbar.ingredients).to eq("lemon zest")
    end
  end

  describe "#mix!" do
   it "shuffles the ingredient array" do
     ingredients = ["lemon zest", "lemon juice", "curd", "sugar"]

     ingredients.each do |ingredient|
       lemonbar.add_ingredient(ingredient)
     end
     expect(lemonbar.ingredients).to eq(ingredients)

     lemonbar.mix!
     expect(lemonbar.ingredients).not_to eq(ingredients)
   end
 end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      lemonbar.eat
      expect(lemonbar.quantity).to eq(lemonbar.quantity - 1)
    end

    it "raises an error if the amount is greater than the quantity" do
      lemonbar.quantity = 10
      expect(lemonbar.eat(11)).to raise_error("There's not enough!")
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
    allow(chef).to recieve(:titalize).and_return("Chef William the Great Baker")
    expect(lemonbar.serve).to eq("Chef William the Great Baker has made 10 lemonbars!")
  end
end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to recieve(:bake).with(lemonbar)
      lemonbar.make_more
    end
  end
end

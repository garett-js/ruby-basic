require "rspec"
require_relative "../app/item"
require_relative "../app/virtual_item"
require_relative "../app/real_item"

describe Item do
  it "Calculate price" do
    item = Item.new(price: 200, name: "book")
    #item.price.should == 230
    expect(item.price).to eq 200
  end

end


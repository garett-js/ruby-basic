class Order
  attr_reader :items

  include ItemContainer
  #include ItemContainer::Info

  def initialize
    @items = Array.new()
  end

  def place

  end
end

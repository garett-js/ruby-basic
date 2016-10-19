class Cart
  attr_reader :items

  include ItemContainer
  #include ItemContainer::Info

  def initialize
    @items = Array.new()
  end
end

class Item

  @@discount = 0.05

  def self.discount
     if Time.now.month == 4
      @@discount += 0.3
    else
      @@discount
    end
  end

  def initialize(options = {})
    @real_price = options[:price]
    @name = options[:name]
  end

  attr_accessor :price, :real_price, :name

  def info
    yield(real_price)
    yield(name)
  end

  def price
    (@real_price - @real_price * self.class.discount) + tax unless real_price.nil?
  end

private
  def tax
    type_tax = if self.class == VirtualItem
      1
    else
      2
    end
    cost_tax = if @real_price > 5
      @real_price * 0.2
    else
      @real_price * 0.1
    end
  end

end

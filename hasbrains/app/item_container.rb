module ItemContainer
  module ClassMethods
    def min_price
      100
    end
  end

  module InstanceMethods

    def method_missing(method_name)
      if method_name =~ /^all_/
        show_all_items_with(method_name.to_s.sub(/^all_/,"").chomp('s'))
      else
        super
      end
    end

    def add_item(item)
      @items << item unless item.price < self.class.min_price
    end

    def remove_item
      @items.pop
    end

    def validate
      @items.each { |item| puts "Item has no price" if item.price.nil?}
    end

    def delete_invalid_items
      @items.delete_if { |item| item.price.nil? }
    end

    def place

    end

    def count_valid_items
      @items.count { |i| i.price }
    end

    private
    def show_all_items_with(name)
      @items.map { |item| item if item.name == name }.delete_if { |i| i.nil? }
    end
  end

  def self.included(base)
    #p "base: #{base}"
    base.extend         ClassMethods
    base.send :include, InstanceMethods
  end
end

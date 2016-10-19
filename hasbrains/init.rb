require_relative "app/storeapplication"

StoreApplication.config do |app|
  app.name = "My Store"
  app.environment = :production

  app.admin do |admin|
    admin.email = "admin@mystore.com"
    admin.login = "admin"
    admin.send_info_emails_on :mondays
  end
end
unless StoreApplication::Admin.frozen?
  StoreApplication::Admin.email = "jhgasd@sdf.com"
end

puts StoreApplication.name
puts StoreApplication.environment
puts StoreApplication.admin.email

real_item1 = RealItem.new({price: 120, weight: 100, name: "book"})
real_item2 = RealItem.new({price: 130, weight: 300, name: "book"})
real_item3 = RealItem.new({price: 140, weight: 200, name: "book"})
real_item4 = RealItem.new({price: 999, weight: 400, name: "iphone"})
#virt_item = VirtualItem.new({price: 110, name: "RubyGame"})


cart = Cart.new
cart.add_item(real_item1)
cart.add_item(real_item2)
cart.add_item(real_item3)
cart.add_item(real_item4)
#cart.add_item(virt_item)

puts cart.all_books

puts cart.items.size

# puts RealItem.discount
# puts "Реальная цена: #{real_item.real_price}"
# puts "Цена с учетом налога: #{real_item.price}"

# order = Order.new
# order.add_item(real_item)
# order.add_item(virt_item)
# order.add_item(real_item2)
# puts order.items.size

# puts order.count_valid_items

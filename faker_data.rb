#create fake product data and paste into console
1000.times do
	product = Product.new({:name => Faker::Commerce.product_name, :price => Faker::Commerce.price(1..5000), :description => Faker::Lorem.sentence(1), :category_id => Category.all.sample.id})
	product.save
end
#create 1000 fake bank customers
1000.times do
	BankCustomer.create({:name => Faker::Name.name, :balance => Random.rand(1..1000), :account_number => Faker::Code.imei})
end
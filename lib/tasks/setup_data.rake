task :setup_data => :environment do 
	10.times do 
		ProductCategory.create(name: Faker::Commerce.department)
	end

	500.times do 
		Product.create(name: Faker::Commerce.product_name, price: Faker::Commerce.price, product_category_id: ProductCategory.all.pluck(:id).sample)
	end


	User.create(email: "admin@admin.com", password: "secret123")
end
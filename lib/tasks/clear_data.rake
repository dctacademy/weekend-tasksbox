task :clear_data => :environment do 
	ProductCategory.delete_all
	Product.delete_all
end
class Product < ActiveRecord::Base
	belongs_to :product_category

	before_save :update_category_column 

	validates :product_category_id, presence: true


	private 

	def update_category_column
		self.category = self.product_category.name
	end
end

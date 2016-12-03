class AddColumnsToProducts < ActiveRecord::Migration
  def change
    add_column :products, :product_category_id, :integer
    add_column :products, :price, :float
  end
end

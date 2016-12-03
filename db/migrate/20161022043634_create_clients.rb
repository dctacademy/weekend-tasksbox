class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
    	t.string :name # varchar (255)  
    	t.string :company
    	t.string :email
    	t.string :mobile

      t.timestamps null: false
      # t.datetime :created_at
      # t.datetime :updated_at
    end
  end
end

=begin 
	t.integer :age
	t.boolean :is_completed
	t.float   :price 
	t.text    :bio
=end 
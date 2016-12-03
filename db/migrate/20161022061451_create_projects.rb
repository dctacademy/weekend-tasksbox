class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
    	t.string :name
    	t.text :description 
    	t.integer :client_id
    	t.date :start_date
    	t.string :status 
      t.timestamps null: false
    end
  end
end

class AddColumnToClients < ActiveRecord::Migration
  def change
    add_column :clients, :gender, :string
  end
end

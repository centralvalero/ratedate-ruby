class AddToUser < ActiveRecord::Migration
  def change
    add_column :users, :gender, :string
    add_column :users, :relationship_status, :string
  end
end

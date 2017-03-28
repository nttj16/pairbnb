class ChangeLocationColumnListings < ActiveRecord::Migration[5.0]
  def change
    remove_column :listings, :location, :string
    add_column :listings, :city, :string
    add_column :listings, :state, :string
    add_column :listings, :country, :string 
  end
end

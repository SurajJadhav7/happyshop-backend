class AddDetailsToProducts < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :subcategory, :string
    add_column :products, :discount, :integer
    add_column :products, :is_new, :boolean
    add_column :products, :model, :string
    add_column :products, :color, :string
    add_column :products, :thumbnail, :string
    add_column :products, :image, :string
  end
end

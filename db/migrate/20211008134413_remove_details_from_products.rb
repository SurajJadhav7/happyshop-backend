class RemoveDetailsFromProducts < ActiveRecord::Migration[6.1]
  def change
    remove_column :products, :under_sale, :boolean
    remove_column :products, :sale_text, :string
  end
end

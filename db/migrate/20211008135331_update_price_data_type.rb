class UpdatePriceDataType < ActiveRecord::Migration[6.1]
  def change
    change_column :products, :price, :decimal, precision: 10, scale: 2
    change_column :products, :sale_price, :decimal, precision: 10, scale: 2
  end
end

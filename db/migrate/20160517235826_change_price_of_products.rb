class ChangePriceOfProducts < ActiveRecord::Migration
  def change
    change_column :products, :price, "numeric USING CAST(price AS numeric)", precision: 9, scale: 2
  end
end

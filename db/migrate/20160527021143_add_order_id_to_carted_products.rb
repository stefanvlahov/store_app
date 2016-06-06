class AddOrderIdToCartedProducts < ActiveRecord::Migration
  def change
    add_column :carted_products, :order_id, :integer
  end
end

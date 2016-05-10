class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :make
      t.string :model
      t.string :price
      t.string :image
      t.string :description

      t.timestamps null: false
    end
  end
end

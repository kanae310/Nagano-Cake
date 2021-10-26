class CreateOrderDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :order_details do |t|
      t.integer :amount
      t.integer :purchase_price
      t.integer :production_status, default: '0'
      t.integer :item_id
      t.integer :order_id

      t.timestamps
    end
  end
end

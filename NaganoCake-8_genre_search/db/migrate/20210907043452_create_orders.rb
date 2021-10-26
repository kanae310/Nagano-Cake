class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :name
      t.string :postal_code
      t.string :address
      t.integer :pay_method,default: 'o'
      t.integer :charge
      t.integer :claim_amount
      t.integer :status, default: '0'
      t.integer :end_user_id

      t.timestamps
    end
  end
end

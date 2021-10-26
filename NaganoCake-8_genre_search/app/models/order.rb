class Order < ApplicationRecord
 has_many :order_details, dependent: :destroy
 belongs_to :end_user
 enum pay_method: { credit_card: 0, transfer: 1 }
 enum status: { wait_pay: 0, confirm_pay: 1, in_production: 2, prepare_ship: 3, sipped: 4 }
end

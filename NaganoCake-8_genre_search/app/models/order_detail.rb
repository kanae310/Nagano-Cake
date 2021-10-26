class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :item
   enum production_status: { impossible: 0, wait_product: 1,in_product: 2,producted: 3,}

end

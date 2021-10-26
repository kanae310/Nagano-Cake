class Address < ApplicationRecord
  belongs_to :end_user
  def full_address
    '〒' + postal_code + ' ' + address + ' ' + name
  end

end

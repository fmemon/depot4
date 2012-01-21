class Order < ActiveRecord::Base
  has_many :line_items, dependent: :destroy
  
  
  PAYMENT_TYPES = ["Check", "Credit card", "Purchase Order"]
  
  validates :name, :address, :email, presence: true
  #validates :pay_type, inclusion: PAYMENT_TYPES
  validates :pay_type, inclusion: PaymentType.names

  def add_line_items_from_cart(cart)
    cart.line_items.each do |item|
      item.cart_id = nil
      line_items << item
    end
  end

end
# == Schema Information
#
# Table name: orders
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  address    :text
#  email      :string(255)
#  pay_type   :string(255)
#  created_at :datetime
#  updated_at :datetime
#


class Product < ActiveRecord::Base
  has_many :line_items, dependent: :destroy
  has_many :orders, through: :line_items

  before_destroy :ensure_not_referenced_by_any_line_items

  validates :title, :description, :image_url, :presence => true
  validates :price, numericality: {greater_than_or_equal_to: 0.01 }
  validates :title, length: { :minimum => 5 }, uniqueness: true
  validates :image_url, allow_blank: true, format: { with: %r{\.(gif|jpg|png)$}i, message: "must be a URL for GIF, JPG, or PNG image. "}


	validates :image_url,    :uniqueness => true
	validates :price, :numericality => {:less_than_or_equal_to =>    1000}


  private
  
    #ensure that there are no line items referencing this product
    def ensure_not_referenced_by_any_line_items
      if line_items.empty?
        return true
      else
        errors.add(:base, 'Line Items present')
        return false
      end
    end

end
# == Schema Information
#
# Table name: products
#
#  id          :integer         not null, primary key
#  title       :string(255)
#  description :text
#  image_url   :string(255)
#  price       :decimal(, )
#  created_at  :datetime
#  updated_at  :datetime
#


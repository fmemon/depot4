class Product < ActiveRecord::Base
  validates :title, :description, :image_url, :presence => true
  validates :price, numericality: {greater_than_or_equal_to: 0.01 }
  validates :title, length: { :minimum => 5 }, uniqueness: true
  validates :image_url, allow_blank: true, format: { with: %r{\.(gif|jpg|png)$}i, message: "must be a URL for GIF, JPG, or PNG image. "}
  #  validates :image_url, allow_blank: true, format: {
  #  with:    %r{\.(gif|jpg|png)$}i,
   # message: 'must be a URL for GIF, JPG or PNG image.'}
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


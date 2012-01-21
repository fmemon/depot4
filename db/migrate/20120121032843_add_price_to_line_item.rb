class AddPriceToLineItem < ActiveRecord::Migration
  def change
    add_column :line_items, :price, :decimal
    LineItem.all.each do |item|
      item.price = item.product.price
    end
  end
end

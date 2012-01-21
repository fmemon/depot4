class StoreController < ApplicationController
  def index
    @products = Product.order(:title)
    #@current_time = Time.now.strftime("%Y-%m-%d %H:%M:%S")

  end

end

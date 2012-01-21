class StoreController < ApplicationController
  def index
    @products = Product.order(:title)
    session_counter
  end

  def session_counter
    session[:counter] ||= 0
    session[:counter] += 1
    puts "counter: #{session[:counter]}"
  end

end

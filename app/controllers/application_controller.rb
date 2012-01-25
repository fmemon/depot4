class ApplicationController < ActionController::Base
  #before_filter :authorize
  protect_from_forgery
  
  before_filter :prepare_time_for_display
	
	
	private 
	
	def current_cart
	  Cart.find(session[:cart_id])
	rescue ActiveRecord::RecordNotFound
	  cart = Cart.create
	  session[:cart_id] = cart.id
	  cart
	end
	
	def prepare_time_for_display
		@current_time = Time.now.strftime("%b %d, %Y")
	end

  protected
    def authorize
      unless User.find_by_id(session[:user_id])
        redirect_to login_url, notice: "Please log in"
      end
    end

end

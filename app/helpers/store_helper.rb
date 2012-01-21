module StoreHelper
 def session_counter
   if session[:counter] > 5
     render 'session_counter'
   end
 end
end

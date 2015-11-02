post "/products" do
	if logged_in? #if logged in, allow user to create a new question
  	Product.create(
  		description: params[:product][:description], 
  		user_id: session[:id]
  	)
    @message = "Your product has been successfully posted!"
    erb :"homepage"
  else
	  @message = "Please log-in!"
		erb :"homepage"
	end
end

# get "/products/:product_id" do
#   if logged_in?
#     @message = "Your product has been successfully posted!"
#     erb :"homepage"
#   else
#     @message = "Please log-in!"
#     erb :"homepage"
#   end
# end
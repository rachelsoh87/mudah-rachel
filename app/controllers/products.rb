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

get "/products/:product_id" do
  @product = Product.find(params[:product_id])
  @product_poster = User.find(@product.user_id)

  if logged_in?
    erb :"individual_product"
  else
    @message = "Please log-in!"
    erb :"homepage"
  end
end


get "/products/:product_id/edit" do
  @product = Product.find(params[:product_id])
  @product_poster = User.find(@product.user_id)
  if logged_in?
    if current_user == Product.find(params[:product_id]).user
      erb :"edit_product"
    else
      @message = "Sorry you're not authorized to edit this product!"
      erb :"individual_product"
    end
  else
    @message = "Please log-in!"
    erb :"homepage"
  end
end


patch "/products/:product_id/edit" do
  @product = Product.find(params[:product_id])
  @product_poster = User.find(@product.user_id)
  if logged_in?
    @product.update(description: params[:product][:description])
    @message = "Product successfully edited!"
  erb :"individual_product"
  else
    @message = "Please log-in!"
    erb :"homepage"
  end
end

delete "/products/:product_id/delete" do
  @product = Product.find(params[:product_id])
  @product_poster = User.find(@product.user_id)
  if logged_in?
    #if current user is the same as product uploader, allow that individual to edit
    if current_user == Product.find(params[:product_id]).user 
      @product.destroy
      @message = "Product successfully deleted!"
      erb :"homepage"
    else
      @message = "Sorry you're not authorized to edit this question!"
      erb :"individual_product"
    end
  else
    @message = "Please log-in!"
    erb :"homepage"
  end
end




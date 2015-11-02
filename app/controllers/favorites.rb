post "/products/:product_id/favorites/add" do
  @product = Product.find(params[:product_id])
  @product_poster = User.find(@product.user_id)
  @all_favorites = Favorite.all
	if logged_in?
		favorite = Favorite.create(
			product_id: params[:product_id],
			user_id: @product.user_id
		)
		@message = "Successfully added to favorites!"
	erb :"individual_product"
	else
    @message = "Please log-in!"
    erb :"homepage"
	end
end

# delete "/products/:product_id/favorites/delete" do
#   @product = Product.find(params[:product_id])
#   @product_poster = User.find(@product.user_id)

# 	@selected_favorite = Favorite.where(product_id: params[:product_id], user_id: current_user.id) 
# 	if logged_in?
# 		if current_user == Favorite.find(params[:product_id]).user 
# 			@selected_favorite.destroy
# 			@message = "Successfully removed from favorites!"
# 		erb :"individual_product"
# 		end
# 	else
#     @message = "Please log-in!"
#     erb :"homepage"
# 	end
# end
get '/' do
    erb :"homepage"
end

get "/signup" do 

  erb :"signup_page"
end

post "/signup" do #create a user
  user_exists = User.find_by(email: params[:user][:email])
  if user_exists.nil?
    user = User.create(params[:user])
    @message = "Signed up. You may now login."
    redirect to "/login"
  else
    @message = "Sign up failed"
  end
   redirect to "/login"  
end

get "/login" do
  erb :"login_page"
end

post "/login" do #submit details to compare to the table info
  user = User.authenticate(params[:user][:email], params[:user][:password])
  session[:id] = user.id
  @message = "You have successfully logged in!"
erb :"homepage"
end

get "/logout" do
  session[:id] = nil
  @message = "You have successfully logged out!"
erb :"homepage"  
end

get "/users/:user_id" do
  if logged_in?
    @user = User.find(params[:user_id])

  erb :"my_profile"  
  else
    @message = "Please log-in!"
    erb :"homepage"
  end
end

get "/users/:user_id/products" do
  if logged_in?
#display all the questions posted by a particular user
#find each question posted by one user
  user = User.find(params[:user_id])
  @users_products = Product.where(user_id: user.id) 

  erb :"my_products"
  else
    @message = "Please log-in!"
    erb :"homepage"
  end
end


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



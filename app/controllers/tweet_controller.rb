get '/tweets/index' do
  if logged_in?
    @user = User.find(session[:user_id])
    erb :"/tweets/index"
  else
    redirect "/login"
  end
end

class UserController < ApplicationController

  get '/login' do
    if logged_in?
      redirect "/tweets/index"
    end
    erb :"/users/login"
  end

  post "/login" do
    @user = User.find_by(:username => params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect "/tweets/index"
    else
      redirect "/users/login"
    end
  end
  
  get '/logout' do
    if logged_in?
  		session.clear
  		redirect "/login"
    else
      redirect "/"
    end
  end
end

class UserController < ApplicationController
  get '/logout' do
    if logged_in?
  		session.clear
  		redirect "/login"
    else
      redirect "/"
    end
  end
end

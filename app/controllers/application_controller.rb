require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "topsecret"
  end

  get '/' do
    erb :index
  end

  get '/signup' do
    if logged_in?
      redirect "/tweets/index"
    end
    erb :"/users/signup"
  end

  post "/signup" do
    if params.has_value?("")
      redirect "/signup"
    end
    @user = User.create(:username => params[:username], email: params[:email], :password => params[:password])
    session[:user_id] = @user.id
    redirect '/tweets/index'
  end

  get '/login' do
    erb :'/tweets/index'
  end


  helpers do
    def logged_in?
      !!session[:user_id]
    end

    def current_user
      @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end
  end

end

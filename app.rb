require "sinatra/base"
require "sinatra/flash"

class App < Sinatra::Base
  enable :sessions
  register Sinatra::Flash
  set :erb, :escape_html => true

  def title
    "My App"
  end

  get "/" do
    erb :index
  end

  post "/flash" do
    flash[:success] = 'Flash messages are often used to show dismissable success, warning and error messages.'
    flash[:warning] = 'This is a warning message.'
    flash[:danger]  = 'Don\'t panic but everything is broken.'
    flash[:info]    = "You entered the message: \"#{params[:message]}\""
    
    # Not sure how to get the base path
    redirect "/pun/dev/si-19-sinatra-base/"
  end
end

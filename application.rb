require 'sinatra/base'

class Application < Sinatra::Application

  def initialize(app=nil)
    super(app)

    # initialize any other instance variables for you
    # application below this comment. One example would be repositories
    # to store things in a database.

  end

  get '/' do
    erb :index, locals: {array_of_computers: DB[:computers].to_a}
  end

  get '/computers/new' do
    erb :"computers/new"
  end

  post '/computers' do
    DB[:computers].insert(brand: params[:brand], color: params[:color], size: params[:size], ram: params[:ram])
    redirect '/'
  end


end
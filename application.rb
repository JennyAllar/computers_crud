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
    computer_id = params[:id]
    DB[:computers].where(id: computer_id).insert(brand: params[:brand], color: params[:color], size: params[:size], ram: params[:ram])
    redirect '/'
  end

  get '/computers/:id/edit' do
    computer_id = params[:id]
    single_computer = DB[:computers][id: computer_id]
    erb :"computers/edit", locals: {single_computer: single_computer}
  end

  put '/computers/:id' do
    computer_id = params[:id]
    DB[:computers].where(id: computer_id).update(brand: params[:brand], color: params[:color], size: params[:size], ram: params[:ram])
    redirect '/'
  end


end
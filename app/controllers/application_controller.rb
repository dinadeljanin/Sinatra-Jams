require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get "/" do
    # should there be a form here to create a new one?
    erb :welcome
  end

  get '/artists/new' do
    erb :new
  end

  # post for new here
  post '/artists' do
    @artist = Artist.create(name: params[:name], age: params[:age], bio: params[:bio])
    redirect "/artists/#{@artist.id}"
  end

  # show all
  get '/artists' do
    @artists = Artist.all
    erb :index
  end

  # show one
  get '/artists/:id' do
    @artist = Artist.find(params[:id])
    erb :show
  end

  # edit
  get 'artists/:id/edit' do
    @artist = Artist.find(params[:id])
    erb :edit
  end
end

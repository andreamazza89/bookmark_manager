ENV["RACK_ENV"] ||= "development"
require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup'

class BookmarkManager < Sinatra::Base

  register Sinatra::Flash

  enable :sessions
  set :session_secret, 'super secret'

  get '/' do
    redirect '/links' 
  end

  get '/links' do
  	@links = Link.all
  	erb :'links/index'
  end

  get '/links/new' do
  	erb :'links/new'
  end

  get '/users/new' do
    @user = User.new
  	erb :'users/new'
  end

  post '/users/new' do
  	@user = User.new(email: params[:email], 
                     password: params[:password], 
                     password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect '/links'
    else
      flash.now[:notice] = 'Password and confirmation password do not match'
    end
      erb :'users/new'
  end

  post '/links' do
    link = Link.create(url: params[:url], title: params[:title])
    params[:tags].split.each do |tag_name|
      tag = Tag.first_or_create(name: tag_name)
      LinkTag.create(link: link, tag: tag)
    end
    
    redirect '/links'
  end

  get '/tags/:name' do
    tag = Tag.first(name: params[:name])
    @links = tag ? tag.links : []
    erb :'links/index'
  end


  run! if app_file == $0

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end
end

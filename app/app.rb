ENV["RACK_ENV"] ||= "development"
<<<<<<< HEAD

require 'sinatra/base'
require_relative 'data_mapper_setup'

class BookmarkManager < Sinatra::Base

  get '/' do
    'Hello BookmarkManager!'
  end

  get '/links' do
    @links = Link.all
    erb :'links/index'
  end

  post '/links' do
    link = Link.new(url: params[:url], title: params[:title])
    tag = Tag.first_or_create(name: params[:tags])
    link.tags << tag
    link.save
    
    redirect '/links'
  end

  get '/links/new' do
    erb :'links/new'
  end
  # start the server if ruby file executed directly
  run! if app_file == $0
end
=======
require 'sinatra/base'
require_relative './lib/link'

class BookmarkManager < Sinatra::Base
  get '/' do
  	"Hello!"
  end

  get '/links' do
  	@links = Link.all
  	erb :'links/index'
  end

  get '/links/new' do
  	erb :'links/new'
  end

  post '/links' do
    Link.create(url: params[:url], title: params[:title])
    redirect '/links'
  end


  run! if app_file == $0
end
>>>>>>> 444628c095d81645d5c880f0632c27f6e97d3969

require 'sinatra'

get '/' do
  erb :index
end

get '/showimage' do
  @image = params[:image]
  erb :showimage
end
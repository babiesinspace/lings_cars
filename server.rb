require "sinatra"
require "sinatra/activerecord"
require "shotgun"

require_relative './models/car'
require_relative './models/user'

set :database, {adapter: 'postgresql', database: 'lings-cars'}

configure do
    enable :sessions unless test?
    set :session_secret, "secret"
 end

get '/' do 
	session[:message] = "Hello world"
	"#{session[:message]}"
end 

get '/message' do 
	"#{session[:message]}"
end 
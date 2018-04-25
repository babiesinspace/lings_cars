require "sinatra"
require "sinatra/activerecord"
require "shotgun"

require_relative './models/car'
require_relative './models/user'
require_relative './models/admin'

set :database, {adapter: 'postgresql', database: 'lings-cars'}

configure do
    enable :sessions unless test?
    set :session_secret, "secret"
 end

get '/' do 
	if !session[:id].nil? 
		@admin = Admin.find(session[:id])
	else
		@default = Admin.first
	end 
	@cars = Car.all
	erb :index
end

get '/login' do 
	erb :login
end 

get '/admin/new/create' do 
	@admin = Admin.find(session[:id])
	erb :new
end 

get '/admin/new' do 
	@admin = Admin.find(session[:id])
	erb :new
end 

get '/logout' do 
	session[:id] = nil
	session.clear
	redirect ('/')
end 

post '/admin/new' do 
	@admin = Admin.find(session[:id])
	@car = Car.create(model: params[:model], description: params[:description], image: params[:image], price: params[:price], admin_id: @admin.id)
	if @car 
		@message = "Created!"
	else 
		@message = "Something went wrong"
	end
	redirect '/admin/new'
end 

post '/admin' do 
	@admin = Admin.find_by(email: params[:email], password: params[:password])
	if @admin
		session[:id] = @admin.id
		redirect ("/admin/new/create")
	else 
		@error = "Sorry wrong info!"
		erb :login
	end 
end 	
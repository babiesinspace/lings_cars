require "sinatra"
require "sinatra/activerecord"

require_relative './models/car'
require_relative './models/user'

set :database, {adapter: 'postgresql', database: 'lings-cars'}
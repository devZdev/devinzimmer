require 'sinatra'
require 'mongo'
require 'uri'

require_relative 'lib/database'
require_relative 'lib/posts_routes'

class App < Sinatra::Application
	
	include Database

	register PostRoutes
	
	get '/' do
		erb :home, {:layout => true}
	end

end
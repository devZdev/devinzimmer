require 'sinatra'
require 'mongo'
require 'uri'

require_relative 'clients/database_client'
require_relative 'routes/posts_routes'

class App < Sinatra::Application
	
	include DatabaseClient

	register PostsRoutes
	
	get '/' do
		erb :home, {:layout => true}
	end

end
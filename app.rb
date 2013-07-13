require 'sinatra'
require 'mongo'
require 'uri'

module DZ
	class App < Sinatra::Application

		def get_connection
				return @db_connection if @db_connection	
			db = URI.parse(ENV['MONGOHQ_URL'])
			db_name = db.path.gsub(/^\//, '')
		
			@db_connection = Mongo::Connection.new(db.host, db.port).db(db_name)
			@db_connection.authenticate(db.user, db.password) unless (db.user.nil? || db.user.nil?)
  			@db_connection
		end

		get '/' do
			db = get_connection
			puts "Collections"
			puts "==========="
			collections = db.collection_names
			puts collections
	  		erb :layout
		end
	end
end
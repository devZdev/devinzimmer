require 'sinatra'
require 'mongo'
require 'uri'

module DZ
	class App < Sinatra::Application

		def get_connection
				return @db_connection if @db_connection	

			if ENV['RACK_ENV'] != 'development' then
				db = URI.parse(ENV['MONGOHQ_URL'])
				db_name = db.path.gsub(/^\//, '')
				@db_connection = Mongo::MongoClient.new(db.host, db.port).db(db_name)
				@db_connection.authenticate(db.user, db.password) unless (db.user.nil? || db.user.nil?)
	  			@db_connection
  			else
  				@db_connection = Mongo::MongoClient.new("localhost", 27017)
  				@db_connection
  			end
		end

		get '/' do
			db = get_connection
			puts "Databases"
			puts "==========="
			databases = db.database_names
			puts databases
	  		erb :layout
		end
	end
end
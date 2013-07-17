require 'sinatra'
require 'mongo'
require 'uri'

module DZ
	class App < Sinatra::Application

		def get_db_connection
				return @db_connection if @db_connection	

			if ENV['RACK_ENV'] != 'development' then
				db = URI.parse(ENV['MONGOHQ_URL'])
				db_name = db.path.gsub(/^\//, '')
				@db_connection = Mongo::MongoClient.new(db.host, db.port).db(db_name)
				@db_connection.authenticate(db.user, db.password) unless (db.user.nil? || db.user.nil?)
	  			@db_connection
  			else
  				@db_connection = Mongo::MongoClient.new("localhost", 27017).db('db-mongodb-dev')
  				@db_connection
  			end
		end

		get '/' do
			db = get_db_connection
			posts_collection = db['posts']
			posts = posts_collection.find.each.to_a
	  		erb :layout, :locals => {:posts => posts}
		end

		get '/posts' do
			db = get_db_connection
			posts_collection = db['posts']
			posts = posts_collection.find.each.to_a
	  		erb :layout, :locals => {:posts => posts}
		end

		get '/posts/add_test_post' do
			post = {"author" => "Sinatra", "title" => "Test Post Title", "body" => "Test Post Body" }
			db = get_db_connection
			posts_collection = db['posts']
			posts_collection.insert(post)
			posts = posts_collection.find.each.to_a
			erb :layout, :locals => {:posts => posts}
		end

		get '/posts/delete_test_posts' do
			param = {"author" => "Sinatra"}
			db = get_db_connection
			posts_collection = db['posts']
			posts_collection.remove(param)
			posts = posts_collection.find.each.to_a
			erb :layout, :locals => {:posts => posts}
		end 
	end
end
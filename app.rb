require 'sinatra'
require 'mongo'
require 'uri'

require_relative 'lib/mongo_connection'

module DZ
	class App < Sinatra::Application
		
		include MongoConnection

		get '/' do
			erb :home, {:layout => true}
		end

		get '/posts/add' do
			erb :posts_add, {:layout => true}
		end

		get '/posts/edit/:id' do
			post = posts_collection.find("_id" => BSON::ObjectId(params[:id])).to_a
	  		erb :posts_edit, {:layout => true, :locals => {:post => post[0]}}
		end

		#index
		get '/posts' do
	  		erb :posts_index, {:layout => true, :locals => {:posts => posts_collection.find.each.to_a}}
		end

		#create
		post '/posts' do 
			post = {"author" => params[:author], "title" => params[:title], "body" => params[:body]}
			posts_collection.insert(post)
			redirect "/posts"
		end

		#read
		get '/posts/:id' do
			post = posts_collection.find("_id" => BSON::ObjectId(params[:id])).to_a
	  		erb :posts_view, {:layout => true, :locals => {:post => post[0]}}
		end

		#update
		put '/posts/:id' do 
			update = {"author" => params[:author], "title" => params[:title], "body" => params[:body]}
			posts_collection.update({"_id" => BSON::ObjectId(params[:id])}, update)
			redirect "/posts"
		end

		#html update support
		post '/posts/edit/:id' do
			update = {"author" => params[:author], "title" => params[:title], "body" => params[:body]}
			posts_collection.update({"_id" => BSON::ObjectId(params[:id])}, update)
			redirect "/posts"
		end

		#delete
		delete '/posts/:id' do
			posts_collection.remove("_id" => BSON::ObjectId(params[:id]))
			redirect "/posts" 
		end

		#html delete support
		post '/posts/delete/:id' do
			posts_collection.remove("_id" => BSON::ObjectId(params[:id]))
			redirect "/posts" 
		end

		get '/*' do
			erb '404 -- This page does not exist!', :layout => true
		end
	end
end
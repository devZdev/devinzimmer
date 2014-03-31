module PostsRoutes
	# #add form
	# get '/posts/add' do
	# 	erb :posts_add, {:layout => true}
	# end

	# #edit form
	# get '/posts/edit/:id' do
	# 	post = posts_collection.find("_id" => BSON::ObjectId(params[:id])).to_a
 #  		erb :posts_edit, {:layout => true, :locals => {:post => post[0]}}
	# end

	# #index
	# get '/posts' do
 #  		erb :posts_index, {:layout => true, :locals => {:posts => posts_collection.find.each.to_a}}
	# end

	# #create
	# post '/posts' do
	# 	posts_collection.insert(params)
	# 	redirect "/posts"
	# end

	# #read
	# get '/posts/:id' do
	# 	post = posts_collection.find("_id" => BSON::ObjectId(params[:id])).to_a
 #  		erb :posts_view, {:layout => true, :locals => {:post => post[0]}}
	# end

	# #update
	# put '/posts/:id' do 
	# 	posts_collection.update({"_id" => BSON::ObjectId(params[:id])}, params)
	# 	redirect "/posts"
	# end

	# #html update support
	# post '/posts/edit/:id' do
	# 	posts_collection.update({"_id" => BSON::ObjectId(params[:id])}, params)
	# 	redirect "/posts"
	# end

	# #delete
	# delete '/posts/:id' do
	# 	posts_collection.remove("_id" => BSON::ObjectId(params[:id]))
	# 	redirect "/posts" 
	# end

	# #html delete support
	# post '/posts/delete/:id' do
	# 	posts_collection.remove("_id" => BSON::ObjectId(params[:id]))
	# 	redirect "/posts" 
	# end

	# #delete all posts
	# get '/dall' do
	# 	posts_collection.remove()
	# 	redirect "/posts" 
	# end
end
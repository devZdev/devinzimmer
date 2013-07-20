module MongoConnection
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

	def posts_collection
		db = get_db_connection
		db['posts']
	end
end
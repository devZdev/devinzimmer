require 'sinatra'

module DZ
	class App < Sinatra::Application
		get '/' do
	  		erb :layout
		end
	end
end
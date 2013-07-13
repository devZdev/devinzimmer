$stdout.sync = true
Bundler.require(:rack)

port = (ARGV.first || ENV['PORT'] || 3000).to_i
env = ENV['RACK_ENV'] || 'development'

#ENV['MONGOHQ_URL'] = "mongodb://heroku:b790650538adc2ffa8384e2fc47fa1ff@dharma.mongohq.com:10088/app16855475"

require 'em-proxy'
require 'logger'
require 'heroku-forward'
require 'heroku/forward/backends/unicorn'

application = File.expand_path('../app.ru', __FILE__)
config_file = File.expand_path('../config/unicorn.rb', __FILE__)
backend = Heroku::Forward::Backends::Unicorn.new(application: application, env: env, config_file: config_file)
proxy = Heroku::Forward::Proxy::Server.new(backend, host: '0.0.0.0', port: port)
proxy.forward!
require File.dirname(__FILE__) + '/app.rb'

# app map
run Rack::URLMap.new({
    "/"         => App,
})

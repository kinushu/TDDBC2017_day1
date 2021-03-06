require 'sinatra'
require 'rspec'
require 'rack/test'

RACK_ENV = 'test' unless defined?(RACK_ENV)
require File.expand_path(File.dirname(__FILE__) + '/../config/boot')
Dir[File.expand_path(File.dirname(__FILE__) + '/../app/helpers/**/*.rb')].each(&method(:require))

RSpec.configure do |conf|
  conf.include Rack::Test::Methods
end

# You can use this method to custom specify a Rack app
# you want rack-test to invoke:
#
#   app Kpckara::App
#   app Kpckara::App.tap { |a| }
#   app(Kpckara::App) do
#     set :foo, :bar
#   end
#
RSpec.configure do |conf|
  conf.include Rack::Test::Methods
end

def app(app = nil, &blk)
  @app ||= block_given? ? app.instance_eval(&blk) : app
  @app ||= Padrino.application
end

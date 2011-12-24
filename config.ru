require 'rubygems'
require 'bundler'
Bundler.require

#other environment locals
ENV['MUSTACHIO_APP_DOMAIN'] = 'localhost:3000'
ENV['root'] = File.expand_path(File.dirname(__FILE__))

#import facebook api credentials
module FacebookAPI
 @root = ENV['root']
 CONFIG = YAML.load_file( @root + "/" + "config/facebook.yml" )[ ENV['RACK_ENV'] ]
 APP_ID = CONFIG['app_id']
 SECRET = CONFIG['secret_key']
 CALLBACK_URL = CONFIG['callback_url']
end

#import Face.com api credentials
module FaceAPI
  @root = ENV['root']
  CONFIG = YAML.load_file( @root + "/" + "config/face.yml" )[ ENV['RACK_ENV'] ]
  KEY = CONFIG['api_key']
  SECRET = CONFIG['secret_key']  
end


require File.join(File.dirname(__FILE__), 'lib', 'mustachio', 'app')

map '/' do
  run Mustachio::App
end

map '/magickly' do
  run Magickly::App
end

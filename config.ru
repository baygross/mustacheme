require 'rubygems'
require 'bundler'
Bundler.require

#other environment locals
ENV['MUSTACHIO_APP_DOMAIN'] = 'localhost:3000'
ENV['root'] = File.expand_path(File.dirname(__FILE__))

#import facebook api credentials
module FacebookAPI
 APP_ID = ENV['fb_app_id'] 
 SECRET = ENV['fb_app_secret'] 
 CALLBACK_URL = ENV['fb_app_callback'] 
end

#import Face.com api credentials
module FaceAPI
  KEY = ENV['face_api_key'] 
  SECRET = ENV['face_api_secret'] 
end


require File.join(File.dirname(__FILE__), 'lib', 'mustachio', 'app')

map '/' do
  run Mustachio::App
end

map '/magickly' do
  run Magickly::App
end

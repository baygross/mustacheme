require File.join(File.dirname(__FILE__), '..', 'mustachio')
require 'sinatra/base'

module Mustachio
  class App < Sinatra::Base
    DEMO_IMAGE = 'http://www.librarising.com/astrology/celebs/images2/QR/queenelizabethii.jpg'
    
    set :static, true
    
    configure :production do
      require 'newrelic_rpm' if ENV['NEW_RELIC_ID']
    end
    
    #------- Routes ------------
    
    #root
    get '/' do 
      redirect '/billgates'
    end
    
    #mustachify
    get '/m' do
        if !params[:src]
          erb :index 
          return
        end
        
        image = Magickly.process_src( params[:src], :mustachify => 0 )
        image.to_response(env)
    end
    
    #social media links
    get '/get_social_media' do
      erb :social
    end
    
    #show a user's page
    get '/:fbid' do
      @fb_user = params[:fbid]
      erb :index
    end
    
  end
end

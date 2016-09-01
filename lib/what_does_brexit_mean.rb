require 'sinatra/base'
require 'tilt/erubis'
require 'json'
require 'yaml'

require_relative 'what_does_brexit_mean/helpers'
require_relative 'what_does_brexit_mean/racks'

module WhatDoesBrexitMean
  class App < Sinatra::Base
    helpers do
      include WhatDoesBrexitMean::Helpers
    end

    get '/' do
      headers 'Vary' => 'Accept'

      respond_to do |wants|
        wants.html do
          @content = "<h1>#{brexit}</h1>"
          @title = 'What Does Brexit Mean?'
          @gh_url = 'https://github.com/pikesley/whatdoesbrexitmean'
          erb :index, layout: :default
        end

        wants.json do
          redirect to '/brexit'
        end
      end
    end

    get '/brexit/?' do
      respond_to do |wants|
        wants.html do
          redirect to '/'
        end

        wants.json do
          {
            brexit: brexit
          }.to_json
        end
      end
    end

    # start the server if ruby file executed directly
    run! if app_file == $0
  end
end

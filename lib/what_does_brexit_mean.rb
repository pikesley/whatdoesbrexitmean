require 'sinatra/base'
require 'erubis'
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
          @img = 'https://media.giphy.com/media/l4Ki6oZ4oPrrgLl9m/giphy.gif'
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
            on_fire: :everything
          }.to_json
        end
      end
    end

    # start the server if ruby file executed directly
    run! if app_file == $0
  end
end

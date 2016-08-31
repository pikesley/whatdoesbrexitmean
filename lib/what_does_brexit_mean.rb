require 'sinatra/base'
require 'tilt/erubis'
require 'json'

require_relative 'what_does_brexit_mean/racks'
require_relative 'what_does_brexit_mean/helpers'

module WhatDoesBrexitMean
  class App < Sinatra::Base
    helpers do
      include WhatDoesBrexitMean::Helpers
    end

    get '/' do
      headers 'Vary' => 'Accept'

      respond_to do |wants|
        wants.html do
          @content = '<h1>Brexit</h1>'
          @title = 'What Does Brexit Mean?'
          erb :index, layout: :default
        end

        wants.json do
          {
            brexit: 'Brexit'
          }.to_json
        end
      end
    end

    # start the server if ruby file executed directly
    run! if app_file == $0
  end
end

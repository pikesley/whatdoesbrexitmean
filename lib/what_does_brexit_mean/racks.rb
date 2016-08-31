require 'rack/conneg'
require 'rack/google-analytics'

module WhatDoesBrexitMean
  class App < Sinatra::Base
    set :public_folder, 'public'
    set :views, 'views'

    use Rack::GoogleAnalytics, :tracker => 'UA-46327971-5'

    use Rack::Conneg do |conneg|
      conneg.set :accept_all_extensions, true
      conneg.set :fallback, :html
      conneg.ignore_contents_of 'public'
      conneg.provide [
        :html,
        :json
      ]
    end

    before do
      if negotiated?
        content_type negotiated_type
      end
    end
  end
end

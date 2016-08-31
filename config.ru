require File.join(File.dirname(__FILE__), 'lib/what_does_brexit_mean.rb')
require 'rack/tracker'

web = Rack::Builder.new do
  use Rack::Tracker do
    handler :google_analytics, { tracker: 'UA-46327971-5' }
  end
  run WhatDoesBrexitMean::App
end

run web

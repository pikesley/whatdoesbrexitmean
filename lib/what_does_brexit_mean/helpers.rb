module WhatDoesBrexitMean
  CONFIG = YAML.load_file('config/config.yml') || {}

  module Helpers
    def brexit
      'Brexit'
    end
  end
end

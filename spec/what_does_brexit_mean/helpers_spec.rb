class TestHelper
  include WhatDoesBrexitMean::Helpers
end

module WhatDoesBrexitMean
  describe Helpers do
    let(:helpers) { TestHelper.new }

    it 'Brexit' do
      expect(helpers.brexit).to eq 'Brexit'
    end

    it 'has a config' do
      expect(CONFIG).to be_a Hash
    end
  end
end

class TestHelper
  include WhatDoesBrexitMean::Helpers
end

module WhatDoesBrexitMean
  describe Helpers do
    let(:helpers) { TestHelper.new }

    it 'says hello' do
      expect(helpers.hello).to eq 'Hello'
    end
  end
end

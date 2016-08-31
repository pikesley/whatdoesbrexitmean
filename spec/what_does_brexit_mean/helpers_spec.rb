class TestHelper
  include WhatDoesBrexitMean::Helpers
end

module WhatDoesBrexitMean
  describe Helpers do
    let(:helpers) { TestHelper.new }

    it 'Brexit' do
      expect(helpers.brexit).to eq 'Brexit'
    end
  end
end

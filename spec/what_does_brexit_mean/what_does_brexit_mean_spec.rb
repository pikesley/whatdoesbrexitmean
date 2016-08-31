module WhatDoesBrexitMean
  JSON_HEADERS = { 'HTTP_ACCEPT' => 'application/json' }

  describe App do
    it 'says Brexit' do
      get '/'
      expect(last_response).to be_ok
      expect(last_response.body).to match /What Does Brexit Mean/
    end

    it 'serves JSON' do
      get '/brexit', nil, JSON_HEADERS
      expect(last_response).to be_ok
      expect(JSON.parse last_response.body).to eq (
        {
          'brexit' => 'Brexit'
        }
      )
    end
  end
end

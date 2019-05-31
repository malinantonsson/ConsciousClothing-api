require 'rails_helper'

RSpec.describe 'Outfits API', type: :request do
  # initialize test data
  let!(:outfits) { create_list(:outfit, 10) }
  let(:outfit_id) { outfits.first.id }

  # Test suite for GET /outfits
  describe 'GET /outfits' do
    # make HTTP get request before each example
    before { get '/outfits' }

    it 'returns outfits' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET /outfits/:id
  describe 'GET /outfits/:id' do
    before { get "/outfits/#{outfit_id}" }

    context 'when the record exists' do
      it 'returns the outfit' do
        expect(json).not_to be_empty
        expect(json['outfit']['id']).to eq(outfit_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:outfit_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Outfit/)
      end
    end
  end

  # Test suite for POST /outfits
  describe 'POST /outfits' do
    # valid payload
    let(:valid_attributes) { { title: 'Learn Elm', created_by: '1' } }

    context 'when the request is valid' do
      before { post '/outfits', params: valid_attributes }

      it 'creates an outfit' do
        expect(json['title']).to eq('Learn Elm')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/outfits', params: { title: 'Foobar' } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: Created by can't be blank/)
      end
    end
  end

  # Test suite for PUT /outfits/:id
  describe 'PUT /outfits/:id' do
    let(:valid_attributes) { { title: 'Shopping' } }

    context 'when the record exists' do
      before { put "/outfits/#{outfit_id}", params: valid_attributes }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  # Test suite for DELETE /outfits/:id
  describe 'DELETE /outfits/:id' do
    before { delete "/outfits/#{outfit_id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end

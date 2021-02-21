require 'rails_helper'

RSpec.describe '/api/v1/type_animals', type: :request do
  let!(:type_animal) { create(:type_animal) }

  let!(:valid_attributes) { build(:type_animal).attributes }

  let(:invalid_attributes) {
    {
      name: nil,
      monthlyCost: nil,
      person_id: nil,
      type_animal: nil
    }
  }

  describe 'GET /index' do
    it 'renders a successful response' do
      get api_v1_type_animals_url
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      get api_v1_type_animal_url(type_animal)
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Type Animal' do
        expect {
          post api_v1_type_animals_url, params: { type_animal: valid_attributes }
        }.to change(TypeAnimal, :count).by(1)
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Type' do
        expect {
          post api_v1_type_animals_url, params: { type_animal: invalid_attributes }
        }.to change(TypeAnimal, :count).by(0)
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) {
        {
          name: 'New name'
        }
      }

      it 'updates the requested type animal' do
        patch api_v1_type_animal_url(type_animal), params: { type_animal: new_attributes }
        type_animal.reload
        expect(type_animal.name).to eq('New name')
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested type animal' do
      expect {
        delete api_v1_type_animal_url(type_animal)
      }.to change(TypeAnimal, :count).by(-1)
    end
  end
end

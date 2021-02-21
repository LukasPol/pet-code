require 'rails_helper'

RSpec.describe '/api/v1/animals', type: :request do
  let!(:animal) { create(:animal) }

  let!(:valid_attributes) { build(:animal).attributes }

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
      get api_v1_animals_url
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      get api_v1_animal_url(animal)
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Animal' do
        expect {
          post api_v1_animals_url, params: { animal: valid_attributes }
        }.to change(Animal, :count).by(1)
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Animal' do
        expect {
          post api_v1_animals_url, params: { animal: invalid_attributes }
        }.to change(Animal, :count).by(0)
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

      it 'updates the requested animal' do
        patch api_v1_animal_url(animal), params: { animal: new_attributes }
        animal.reload
        expect(animal.name).to eq('New name')
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested animal' do
      expect {
        delete api_v1_animal_url(animal)
      }.to change(Animal, :count).by(-1)
    end
  end
end

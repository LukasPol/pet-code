require 'rails_helper'

RSpec.describe '/api/v1/people', type: :request do
  let!(:person) { create(:person) }

  let!(:valid_attributes) { build(:person).attributes }

  let(:invalid_attributes) {
    {
      name: nil,
      cpf: nil,
      birthday: nil
    }
  }

  describe 'GET /index' do
    it 'renders a successful response' do
      get api_v1_people_url
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      get api_v1_people_url(person)
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new person' do
        expect {
          post api_v1_people_url, params: { person: valid_attributes }
        }.to change(Person, :count).by(1)
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Person' do
        expect {
          post api_v1_people_url, params: { person: invalid_attributes }
        }.to change(Person, :count).by(0)
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

      it 'updates the requested person' do
        patch api_v1_person_url(person), params: { person: new_attributes }
        person.reload
        expect(person.name).to eq('New name')
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested person' do
      expect {
        delete api_v1_person_url(person)
      }.to change(Person, :count).by(-1)
    end
  end
end

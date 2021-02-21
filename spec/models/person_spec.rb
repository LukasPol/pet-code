require 'rails_helper'

RSpec.describe Person, type: :model do
  
  it 'should create TypeAnimal' do
    expect do
      create(:person)
    end.to change(Person, :count).by(1)
  end
end
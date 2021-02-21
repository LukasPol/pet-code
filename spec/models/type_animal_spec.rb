require 'rails_helper'

RSpec.describe TypeAnimal, type: :model do
  let!(:type_animal) { build(:type_animal) }

  it 'should create TypeAnimal' do
    expect do
      create(:type_animal)
    end.to change(TypeAnimal, :count).by(1)
  end

  context 'Validates' do
  end
end
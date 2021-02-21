require 'rails_helper'

RSpec.describe Animal, type: :model do
  it 'should create TypeAnimal' do
    expect do
      create(:animal)
    end.to change(Animal, :count).by(1)
  end
end
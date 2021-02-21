FactoryBot.define do
  factory :animal do
    name { FFaker::Name.name }
    monthlyCost { 200.01 }
    person { create(:person) }
    type_animal { create(:type_animal) }
  end
end
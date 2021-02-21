FactoryBot.define do
  factory :person do
    name { FFaker::Name.name }
    cpf { '12312312311' }
    birthday { '2000-02-26' }
  end
end

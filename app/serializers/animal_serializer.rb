class AnimalSerializer < ActiveModel::Serializer
  attributes :id, :name, :monthlyCost
  has_one :type_animal
  class TypeAnimalSerializer < ActiveModel::Serializer
    attributes :name
  end
  has_one :person
end

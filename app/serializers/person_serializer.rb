class PersonSerializer < ActiveModel::Serializer
  attributes :id, :name, :document, :birthday
end

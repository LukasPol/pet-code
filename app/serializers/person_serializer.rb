class PersonSerializer < ActiveModel::Serializer
  attributes :id, :name, :cpf, :birthday
end

class Person < ApplicationRecord
  has_many :animals

  validates :name, :cpf, :birthday, presence: true
end

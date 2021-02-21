class TypeAnimal < ApplicationRecord
  has_many :animals

  validates :name, presence: true
end

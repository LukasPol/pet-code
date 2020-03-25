class Animal < ApplicationRecord
  belongs_to :type_animal
  belongs_to :person
end

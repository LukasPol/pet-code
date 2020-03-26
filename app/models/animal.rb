class Animal < ApplicationRecord
  belongs_to :type_animal
  belongs_to :person

  before_create :verify_total_cost
  before_create :verify_name_person

  validates :name, presence: true

  private
    def verify_total_cost
      @person_id = self.person_id
      @animals_person = Animal.joins(:person).where(person_id: person_id)
      @totalCost = 0 

      @animals_person.each do |animal|
        @totalCost += animal.monthlyCost
      end

      puts @totalCost

      if @totalCost > 1000
        self.errors.add(:monthlyCost, 'Curto mensal maior q 100')
        throw(:abort)
      end
    end
    def verify_name_person
      @person_id = self.person_id
      @personsName = Person.find(person_id).name
      
      if @personsName.first.upcase === 'A'
        self.errors.add(:person, 'Pessoa com inical da letra A, não podem ter gatos')
        throw(:abort)
      end

    end
end

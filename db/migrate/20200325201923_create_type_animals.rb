class CreateTypeAnimals < ActiveRecord::Migration[6.0]
  def change
    create_table :type_animals do |t|
      t.string :name

      t.timestamps
    end
  end
end

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Person.create(name: 'Johnny Cash', document: 555555555, birthday: "26/02/1932")
Person.create(name: 'Sid Vicious', document: 555555555, birthday: "10/05/1957")
Person.create(name: 'Axl Rose', document: 555555555, birthday: "06/02/1962")
Person.create(name: 'Joey Ramone', document: 555555555, birthday: "19/05/1951")
Person.create(name: 'Bruce Dickinson', document: 555555555, birthday: "07/08/1958")
Person.create(name: 'Kurt Cobain', document: 555555555, birthday: "20/02/1967")
Person.create(name: 'Elvis Presley', document: 555555555, birthday: "17/08/2008")

TypeAnimal.create(name: 'Cavalo')
TypeAnimal.create(name: 'Cachorro')
TypeAnimal.create(name: 'Papagaio')
TypeAnimal.create(name: 'Lhama')
TypeAnimal.create(name: 'Iguana')
TypeAnimal.create(name: 'Orinitorrinco')
TypeAnimal.create(name: 'Andorinha')
TypeAnimal.create(name: 'Gato')

Animal.create(name: 'Pé de Pano', monthlyCost: 199.99, type_animal: TypeAnimal.find_by(name: 'Cavalo'), person: Person.find_by(name: 'Johnny Cash'))
Animal.create(name: 'Rex', monthlyCost: 99.99, type_animal: TypeAnimal.find_by(name: 'Cachoroo'), person: Person.find_by(name: 'Sid Vicious'))
Animal.create(name: 'Ajudante do Papai Noel', monthlyCost: 99.99, type_animal: TypeAnimal.find_by(name: 'Cachorro'), person: Person.find_by(name: 'Axl Rose'))
Animal.create(name: 'Rex', monthlyCost: 103.99, type_animal: TypeAnimal.find_by(name: 'Papagaio'), person: Person.find_by(name: 'Joey Ramone'))
Animal.create(name: 'Flora', monthlyCost: 103.99, type_animal: TypeAnimal.find_by(name: 'Lhama'), person: Person.find_by(name: 'Bruce Dickinson'))
Animal.create(name: 'Dino', monthlyCost: 177.99, type_animal: TypeAnimal.find_by(name: 'Iguana'), person: Person.find_by(name: 'Kurt Cobain'))
Animal.create(name: 'Lassie', monthlyCost: 407.99, type_animal: TypeAnimal.find_by(name: 'Ornitorrinco'), person: Person.find_by(name: 'Elvis Presley'))

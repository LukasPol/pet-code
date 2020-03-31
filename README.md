# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


## Questões

As questões devem ser respondidas com queries do `ActiveRecord`.
Inclua os trechos de código que respondem as perguntas abaixo:

### Qual é o custo médio dos animais do tipo cachorro?

	Animal.joins(:type_animal).where("type_animals.name='Cachorro'").sum("monthlyCost")

### Quantos cachorros existem no sistema?

	Animal.joins("INNER JOIN type_animals as ta ON ta.id = animals.type_animal_id AND ta.name = 'Cachorro'").count

	TypeAnimal.joins(:animals).where(name:'Cachorro').count

	Animal.joins(:type_animal).select('type_animals.name').where("type_animals.name='Cachorro'").count


### Qual o nome dos donos dos cachorros (Array de nomes)

	Animal.joins(:type_animal, :person).where("type_animals.name = 'Cachorro'").pluck("people.name")

### Retorne as pessoas ordenando pelo custo que elas tem com os animais (Maior para menor)

	Animal.joins(:person).group("people.name").sum("monthlyCost").sort_by(&:last).reverse().to_h

### Levando em consideração o custo mensal, qual será o custo de 3 meses de cada pessoa?

	SUA RESPOSTA AQUI


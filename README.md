# Pet Love (API)

In Heroku: [pet love](https://pet-love-app.herokuapp.com)

A Project for added pets and your parent and pet's cost.

## Pre-requistes

With Docker
- Docker
- Docker-compose

or without docker, you need install:
- Ruby 2.6.5
- Rails 6.0.0
- PostgreSQL 12

## Setup project with Docker
1. `$ git clone https://github.com/LukasPol/pet-code.git`
2. `$ cd pet-code`
3. `$ cp .env.sample .env`
4. Write a username and password for database in .env
5. `$ docker-compose up --build` or with -d
6. `$ docker-compose exec api bash`
7. `$ rake db:create db:migrate db:seed`
8. `$ rails s -b 0.0.0.0`
9. Open your browser in [localhost:3000](localhost:3000)

## Setup project without Docker
1. `$ git clone https://github.com/LukasPol/pet-code.git`
2. `$ cd pet-code`
3. `$ cp .env.sample .env`
4. Write your database's username and password and change host to localhost in .env
5. `$ rake db:create db:migrate db:seed`
6. `$ rails s`
7. Open your browser in [localhost:3000](localhost:3000)

## API Documentation

Documentation with Postman, [file](https://raw.githubusercontent.com/LukasPol/Challenge-Ruptiva/master/tmp/documentation_postman.json)
Documentation with Insomnia, [file](https://raw.githubusercontent.com/LukasPol/Challenge-Ruptiva/master/tmp/documentation_insomnia.json)

## Gems used
- [Database Cleaner](https://github.com/DatabaseCleaner/database_cleaner)
```
Use database_cleaner to erase tests database.
```

- [Dotenv Rails](https://github.com/bkeepers/dotenv)

```
With the dotenv I can read the file .env and use in application.
```

- [Factory Bot Rails](https://github.com/thoughtbot/factory_bot_rails)

```
I can manage the database of fixures too easy on the factories folder, and the rspec has all compatibility.
```

- [Ffaker](https://github.com/ffaker/ffaker)

```
This gem is to create random data to models I used in tests.
```
- [Rack Cors](https://github.com/cyu/rack-cors)

```
Rack Middleware for handling Cross-Origin Resource Sharing (CORS), which makes cross-origin AJAX possible.
```

- [Rspec](https://github.com/rspec/rspec-rails)

```
to create tests for the project
```

- [Rubocop Rails](https://github.com/rubocop-hq/rubocop-rails)

```
Use this gem to help with good practices.
```

- [Simple Token Authentication](https://github.com/gonzalo-bulnes/simple_token_authentication)

```
This gem was by default on devise, then I used in this application to manage the token authentication of user (on login).
```

<!-- ## Questões

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

	SUA RESPOSTA AQUI -->


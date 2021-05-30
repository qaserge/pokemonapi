# README

Simple API CRUD Rubi on Rails

Rails 6.1.3.2
ruby 3.0.1p64 
MySQL

to run use:
1. create DB
2. change the name and credentials of your DB in config/database.yml
3. run rails local - rails s
4. create table - rails db:migrate
5. put the data to the DB - rails db:seed (it will get the data from lib/seed_csv/pokemon.csv)

GET /api/v1/pokemons returns all data
GET /api/v1/pokemons?page=4&per_page=5 returns 5 pokemons from 4 page
GET /api/v1/pokemons/2 returns 1 pokemon with id 2
POST /api/v1/pokemons create new pokemon
	headers:
	Content-Type - application/json
	body:
	{
		"name":"pokemon 1",
		"type_1":"type 1",
		"type_2":"type 2",
		"total":1,
		"hp":1,
		"attack":1,
		"defense":1,
		"sp_atk":1,
		"sp_def":1,
		"speed":1,
		"generation":1,
		"legendary":true
	}
DELETE /api/v1/pokemons/2 delete pokemon with id 2
PUT GET /api/v1/pokemons/2 update pokemon with id 2
headers:
	Content-Type - application/json
	body:
	{
		"name":"pokemon new name"
	}

request example:
http://localhost:3000/api/v1/pokemons?page=5&per_page=1

response example:
{
    "status": "SUCCESS",
    "message": "Total items: 801, Page: 5 of 160",
    "data": [
        {
            "id": 5,
            "name": "Charmander",
            "type_1": "Fire",
            "type_2": null,
            "total": 309,
            "hp": 39,
            "attack": 52,
            "defense": 43,
            "sp_atk": 60,
            "sp_def": 50,
            "speed": 65,
            "generation": 1,
            "legendary": true,
            "created_at": "2021-05-30T14:23:34.012Z",
            "updated_at": "2021-05-30T14:23:34.012Z"
        }
    ]
}

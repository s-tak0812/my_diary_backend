build:
	docker compose build --progress=plain

db_create:
	docker-compose run --rm app bundle exec rails db:create

migrate:
	docker-compose run --rm app bundle exec ridgepole -c config/database.yml -f ./db/Schemafile --apply --drop-table
	docker-compose run --rm app bundle exec rails db:schema:dump

seed:
	docker-compose run --rm app bundle exec rails db:seed

db_drop:
	docker-compose run --rm app bundle exec rails db:drop

exec_db_reset:
	docker-compose exec app bash -c "bundle exec rails db:drop && \
	bundle exec rails db:create && \
	bundle exec ridgepole -c config/database.yml -f ./db/Schemafile --apply --drop-table && \
	bundle exec rails db:seed"

up:
	docker compose up --remove-orphans --build

up_d:
	docker compose up --remove-orphans -d

down:
	docker compose down

logs:
	docker-compose logs -f

exec_app:
	docker-compose exec app bash

console:
	docker-compose run --rm app bin/rails c

build:
	docker compose build

db_create:
	docker compose run --rm app bin/rails db:create

migrate:
	docker compose run --rm app bin/rails db:migrate

up:
	docker compose up --remove-orphans --build

up_d:
	docker compose up --remove-orphans -d

down:
	docker compose down
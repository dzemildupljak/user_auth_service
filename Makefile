run:
	go run server/*.go

watch:
	reflex -r '\.go$$' -s go run server/*.go

docker-develop-up:
	docker-compose -f docker/docker-compose.yml --env-file .env up

docker-develop-down:
	docker-compose -f docker/docker-compose.yml --env-file .env down

docker-develop-build:
	docker-compose -f docker/docker-compose.yml --env-file .env build

docker-develop-migrateup:
	docker run -v /home/dzemil/Projects/golang/user_auth_service/server/db/postgres/migrations:/server/db/postgres/migrations --network host migrate/migrate -path=/server/db/postgres/migrations -database "postgresql://root:postgres@localhost:5431/auth_service_db?sslmode=disable" up

docker-develop-migratedown:
	docker run -v /home/dzemil/Projects/golang/user_auth_service/server/db/postgres/migrations:/server/db/postgres/migrations --network host migrate/migrate -path=/server/db/postgres/migrations -database "postgresql://root:postgres@localhost:5431/auth_service_db?sslmode=disable" down -all

create-migration:
	@read -p "Enter migration name: " migration_name; \
	migrate create -ext sql -dir server/db/postgres/migrations -seq $$migration_name

migrate-up:
	migrate -path server/db/postgres/migrations -database "postgresql://postgres:postgres@localhost:5432/test_sqlc?sslmode=disable" -verbose up

migrate-down:
	migrate -path server/db/postgres/migrations -database "postgresql://postgres:postgres@localhost:5432/test_sqlc?sslmode=disable" -verbose down


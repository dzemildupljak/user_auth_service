run:
	go run server/*.go

watch:
	reflex -r '\.go$$' -s go run server/*.go

docker-develop-up:
	docker-compose -f docker/docker-compose.yml up

docker-develop-down:
	docker-compose -f docker/docker-compose.yml down


docker-develop-build:
	docker-compose -f docker/docker-compose.yml build

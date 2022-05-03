dev-setup:
	docker-compose build && docker-compose up

dev-run:
	docker-compose exec salesapi $(command)

prod-build:
	docker build -t salesapi .
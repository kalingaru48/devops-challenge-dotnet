dev-setup:
	docker-compose build && docker-compose up

#database base string variable
database_string:= "Server=10.0.0.11,1433;User ID=SA;Password=Your_password123;Database=DevOpsChallenge.SalesApi;ConnectRetryCount=0"

dev-cmd:
	docker-compose exec salesapi dotnet ef --project  "/app/src/DevOpsChallenge.SalesApi.Database" $(command) --connection $(database_string)

prod-build:
	docker build -t salesapi .
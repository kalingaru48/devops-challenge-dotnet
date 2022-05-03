dev-setup:
	docker-compose build && docker-compose up

#database base string variable
database_string:= "Server=localhost,1433;User ID=SA;Password=Your_password123;Database=DevOpsChallenge.SalesApi;ConnectRetryCount=0"

dev-cmd:
	docker-compose exec salesapi dotnet ef --project  "/app/src/DevOpsChallenge.SalesApi.Database" $(command) --connection $(database_string)

build-image:
	docker build -t salesapi .

push-image:
	docker image push
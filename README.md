# devops-challenge-dotnet


## Development setup :wave:

Clone the project repository:

`git clone https://github.com/kalingaru48/devops-challenge-dotnet.git`

Change the directory to "devops-challenge-dotnet" folder

`cd devops-challenge-dotnet`

Run below command to setup the environment

`make dev-setup`

NOTE: For Window users, you need to install make utility with below command: 

`choco install make`

## Runing database migrations commands

`make dev-cmd command="database update"`

NOTE: If you want to change the database connection string, you can change the default "database_string" variable in Makefile


## CI/CD configuration

Continous Integartion pipline is configured in Github Actions.

You can edit `.github/workflows/docker-image.yml` for changes










FROM mcr.microsoft.com/dotnet/sdk:5.0 AS base

ENV ASPNETCORE_ENVIRONMENT=Development
ENV DOTNET_USE_POLLING_FILE_WATCHER=true
ENV ASPNETCORE_URLS=http://+:80

WORKDIR /app

RUN dotnet tool install --global dotnet-ef

ENV PATH="${PATH}:/root/.dotnet/tools"
# ARG database_string="Server=10.0.0.11,1433;User ID=SA;Password=Your_password123;Database=DevOpsChallenge.SalesApi;ConnectRetryCount=0"
# RUN dotnet ef --project  "/app/src/DevOpsChallenge.SalesApi.Database" --connection $database_string database update

FROM base AS build-env

EXPOSE 80

ENTRYPOINT ["dotnet", "run", "-p", "/app/src/DevOpsChallenge.SalesApi"]

FROM build-env as build

WORKDIR /app
# Copy everything
COPY ./src/ ./src
# Restore as distinct layers
RUN dotnet restore /app/src/DevOpsChallenge.SalesApi/DevOpsChallenge.SalesApi.csproj
# Build and publish a release
RUN dotnet publish "/app/src/DevOpsChallenge.SalesApi/DevOpsChallenge.SalesApi.csproj" -c Release -o out

# Build runtime image
FROM mcr.microsoft.com/dotnet/aspnet:5.0
WORKDIR /app
COPY --from=build /app/out .

EXPOSE 80

ENTRYPOINT ["dotnet", "DevOpsChallenge.SalesApi.dll"]
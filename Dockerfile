# Get Base Image (Full .NET Core SDK)
FROM mcr.microsoft.com/dotnet/sdk:6.0-jammy AS base
WORKDIR /src

# Copy csproj and restore
COPY *.csproj ./
RUN dotnet restore

# Copy everything else and build
COPY . ./
RUN dotnet publish -c Release -o app

# Generate runtime image
FROM mcr.microsoft.com/dotnet/aspnet:6.0-jammy as final

WORKDIR /src

EXPOSE 80

COPY --from=base /src/app .

ENTRYPOINT ["dotnet", "weatherapi.dll"]
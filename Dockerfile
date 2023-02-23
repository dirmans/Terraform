# Get Base Image (Full .NET Core SDK)
FROM mcr.microsoft.com/dotnet/sdk:6.0-jammy AS base
WORKDIR /src

# Copy everything else and build
COPY . .
RUN dotnet publish "weatherapi.csproj" -c Release -o /app

# Generate runtime image
FROM mcr.microsoft.com/dotnet/aspnet:6.0-jammy as final

WORKDIR /app
COPY --from=base /app .

EXPOSE 9000

ENTRYPOINT ["dotnet", "weatherapi.dll"]
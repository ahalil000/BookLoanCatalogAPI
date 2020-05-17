FROM microsoft/aspnetcore:2.0 AS base
WORKDIR /app
EXPOSE 80

FROM microsoft/aspnetcore-build:2.0 AS build
WORKDIR /src
COPY ["BookLoan.Catalog.API/BookLoan.Catalog.API.csproj", "BookLoan.Catalog.API/"]
RUN dotnet restore "BookLoan.Catalog.API/BookLoan.Catalog.API.csproj"
COPY . .
WORKDIR "/src/BookLoan.Catalog.API"
RUN dotnet build "BookLoan.Catalog.API.csproj" -c Release -o /app

FROM build AS publish
RUN dotnet publish "BookLoan.Catalog.API.csproj" -c Release -o /app

FROM base AS final
WORKDIR /app
COPY --from=publish /app .
ENTRYPOINT ["dotnet", "BookLoan.Catalog.API.dll"]
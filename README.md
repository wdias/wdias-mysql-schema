# wdias-mysql-schema
MySQL schemas of WDIAS microservices

## Scripts
### Install Database
Make sure to install MySQL Client
- MacOS: `brew install mysql`
```
./scripts/install_database.sh <HELM_CHART_NAME> <DB_NAME> <USERNAME>
```
- `./scripts/install_database.sh adapter-metadata-mysql metadata wdias`
- `./scripts/install_database.sh adapter-extension-mysql extension wdias`

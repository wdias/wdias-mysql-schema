# wdias-mysql-schema
MySQL schemas of WDIAS microservices

## Scripts
### Install Database
```
./scripts/install_database.sh <HELM_CHART_NAME> <DB_NAME> <USERNAME>
```
- `./scripts/install_database.sh adapter-metadata-mysql metadata wdias`
- `./scripts/install_database.sh adapter-extension-mysql extension wdias`

<p align="center">
  <img src="https://github.com/radiantearth/stac-site/raw/master/images/logo/stac-030-long.png" width=400>
  <p align="center">FastAPI implemention of the STAC API spec.</p>
</p>
<p align="center">
  <a href="https://github.com/stac-utils/stac-fastapi-sqlalchemy/actions?query=workflow%3Acicd" target="_blank">
      <img src="https://github.com/stac-utils/stac-fastapi-sqlalchemy/workflows/stac-fastapi-sqlalchemy/badge.svg" alt="Test">
  </a>
  <a href="https://pypi.org/project/stac-fastapi-sqlalchemy" target="_blank">
      <img src="https://img.shields.io/pypi/v/stac-fastapi-sqlalchemy.api?color=%2334D058&label=pypi%20package" alt="Package version">
  </a>
  <a href="https://github.com/stac-utils/stac-fastapi-sqlalchemy/blob/master/LICENSE" target="_blank">
      <img src="https://img.shields.io/github/license/stac-utils/stac-fastapi.-sqlalchemysvg" alt="License">
  </a>
</p>

---

**Documentation**: [https://stac-utils.github.io/stac-fastapi-sqlalchemy/](https://stac-utils.github.io/stac-fastapi-sqlalchemy/)

**Source Code**: [https://github.com/stac-utils/stac-fastapi-sqlalchemy](https://github.com/stac-utils/stac-fastapi-sqlalchemy)

---

Sqlalchemy/postgis backend for [stac-fastapi](https://github.com/stac-utils/stac-fastapi).


## Installation

```bash
pip install stac-fastapi.sqlalchey
```

## Local Development

Use docker-compose via make to start the application, migrate the database, and ingest some example data:
```bash
make image
make docker-run-all
```

By default, the apps are run with uvicorn hot-reloading enabled. This can be turned off by changing the value
of the `RELOAD` env var in docker-compose.yml to `false`.

#### Note to Docker for Windows users

You'll need to enable experimental features on Docker for Windows in order to run the docker-compose,
due to the "--platform" flag that is required to allow the project to run on some Apple architectures.
To do this, open Docker Desktop, go to settings, select "Docker Engine", and modify the configuration
JSON to have `"experimental": true`.

### Testing

Before running the tests, ensure the database and apps run with docker-compose are down:

```shell
docker-compose down
```

The database container provided by the docker-compose stack must be running. This can be started with:

```shell
make run-database
```

To run tests for both the pgstac and sqlalchemy backends, execute:

```shell
make test
```


Run individual tests by running pytest within a docker container:

```shell
make docker-shell
pytest -v tests/api/test_api::test_app_search_response
```

# Contributing

Issues and pull requests are more than welcome.

## Development install

```shell
git clone https://github.com/stac-utils/stac-fastapi-sqlalchemy
cd stac-fastapi-sqlalchemy
make install
```

This repo is set to use `pre-commit` to run *isort*, *flake8*, *pydocstring*, *black* ("uncompromising Python code formatter") and mypy when committing new code.

```bash
pre-commit install
```

### Docs

```bash
git clone https://github.com/stac-utils/stac-fastapi-sqlalchemy
cd stac-fastapi-sqlalchemy
pip install -e .[docs]
```

Hot-reloading docs:

```bash
mkdocs serve
```

To manually deploy docs (note you should never need to do this because GitHub
Actions deploys automatically for new commits.):

```bash
# Create API documentations
pdocs as_markdown \
  --output_dir docs/api/ \
  --exclude_source \
  --overwrite \
  stac_fastapi.sqlalchemy

# deploy
mkdocs gh-deploy
```

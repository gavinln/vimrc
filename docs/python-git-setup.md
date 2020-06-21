# Setup a new project using git for Python

## Initialize git

1. Initialize git

```
git init .
```

2. Start the git repl

```
git-repl
```

4. Display status

```
status
```

5. Generate .gitignore file from https://www.gitignore.io/

```
ignore-io -a python jupyternotebooks
```

6. Display git information

```
info
```

## Setup pre-commit

1. Install pre-commit

```
pip install pre-commit
```

2. Check pre-commit version

```
pre-commit --version
```

3. Create pre-commit file .pre-commit-config.yaml

```
pre-commit sample-config > .pre-commit-config.yaml
```

4. Install git hooks

```
pre-commit install
```

5. Run against all files

```
pre-commit run --all-files
```

### Python pre-commit settings

Add to .pre-commit-config.yaml

```
-   repo: https://gitlab.com/pycqa/flake8
    rev: 3.8.1
    hooks:
    -   id: flake8
```

### Python pytest settings

Add  to pytest.ini
 
```
[pytest]
filterwarnings=
    ignore::DeprecationWarning
```

## Test setup

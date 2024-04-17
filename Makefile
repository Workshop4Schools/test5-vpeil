CONFIG=./pyproject.toml
MAIN_MODULE=

install-documentation-builder:
	$(PIP) install mkdocs mkdocs-material 'mkdocstrings[python]'

start-documentation-server:
	$(INTERPRETER) -m mkdocs serve

deploy-documentation:
	$(INTERPRETER) -m mkdocs gh-deploy --config-file mkdocs.yml

install-package-linter:
	$(PIP) install pylint

install-package-type-checker:
	$(PIP) install mypy

install-package-formatter:
	$(PIP) install black

install-package-builder:
	$(PIP) install --upgrade build

install-package-uploader:
	$(PIP) install --upgrade twine

install-local-package:
	$(PIP) install -e .

install-requirements:
	$(PIP) install

install-test-requirements:
	$(PIP) install unittest-extensions

test-package:
	$(INTERPRETER) -m unittest discover -v src/MAIN_MODULE/tests

lint-package:
	$(INTERPRETER) -m pylint --ignore tests --disable C0114,C0301,C0302 src/MAIN_MODULE

type-check-package:
	$(INTERPRETER) -m mypy --config-file $(CONFIG) ./src/MAIN_MODULE/

format-package:
	$(INTERPRETER) -m black --config $(CONFIG) ./src/MAIN_MODULE/

build-package:
	$(INTERPRETER) -m build

upload-package:
	$(INTERPRETER) -m twine upload --verbose -u '__token__' dist/*

clean:
	rm -rf dist src/MAIN_MODULE.egg-info
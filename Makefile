.PHONY: help
help:
	@echo "clean-pyc - remove Python file artifacts"
	@echo "apidocs - generate Sphinx HTML API documentation"

.PHONY: clean-pyc
clean-pyc:
	find . -name '*.pyc' -exec rm -f {} +
	find . -name '*.pyo' -exec rm -f {} +
	find . -name '*~' -exec rm -f {} +

.PHONY: apidocs
apidocs:
	rm -f apidocs/prov_service_tests.rst
	rm -f apidocs/modules.rst
	rm -f apidocs/_build
	sphinx-apidoc -o apidocs/ prov_service_tests
	$(MAKE) -C apidocs clean
	$(MAKE) -C apidocs html

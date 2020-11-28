.PHONY: test install pep8 release clean

test: pep8
	py.test --doctest-modules codemod

install:
	python setup.py develop

pep8:
	@flake8 codemod --ignore=F403,W503,W504

release: test
	@python setup.py sdist upload

clean:
	@find ./ -name '*.pyc' -exec rm -f {} \;
	@find ./ -name 'Thumbs.db' -exec rm -f {} \;
	@find ./ -name '*~' -exec rm -f {} \;

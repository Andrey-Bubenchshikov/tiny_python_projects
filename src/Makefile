flake8 := flake8 .
mypy := mypy .
bandit := bandit -r . --exclude tests
safety := safety check -i 41002 -i 44715 -i 44716 -i 44717 -i 42497 -i 42498 -i 43738

test:
	pytest -v --cov . --cov-report term-missing --cov-fail-under=100 \
	--color=yes -n 1 \
	-W error -W ignore::ResourceWarning

outdated:
	pip list --outdated --format=columns

flake8:
	$(flake8)

mypy:
	$(mypy)

bandit:
	$(bandit)

safety:
	$(safety)

lint:
	$(flake8) && $(mypy) && $(bandit) && $(safety)

makemessages:
	python manage.py makemessages --all

compilemessages:
	python manage.py compilemessages

check:
	python manage.py check --deploy

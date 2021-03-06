setup:
	python3 -m venv ~/.exercise

install:
	wget https://github.com/hadolint/hadolint/releases/download/v1.17.5/hadolint-Linux-x86_64 -O hadolint
	chmod 755 hadolint
	pip install --upgrade pip &&\
		pip install -r requirements.txt

test:
	#python -m pytest -vv --cov=myrepolib tests/*.py
	#python -m pytest --nbval notebook.ipynb

lint:
	./hadolint Dockerfile --ignore DL3013
	pylint --disable=R,C,W1203 app/hello.py

all: install lint test

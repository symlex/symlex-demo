all: build images push
build: composer js
deploy-demo: docker-login docker-build docker-push
composer:
	(cd demo &&	composer update)
js:
	(cd demo &&	bin/phing build-js)
docker-login:
	bin/docker-login.sh
docker-build:
	docker-compose build
docker-push:
	docker-compose push
all: build images push
build: composer js
deploy-demo: build-demo push-demo
composer:
	(cd demo &&	composer update)
js:
	(cd demo &&	bin/phing build-js)
images:
	docker-compose build
push:
	docker-compose push
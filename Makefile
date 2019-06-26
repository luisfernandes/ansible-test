install:
	docker build -t ansible-base -f env/Dockerfile .

start:
	docker-compose -f env/docker-compose.yml up -d

stop:
	docker-compose -f env/docker-compose.yml stop

attach:
	docker exec -it ansible bash

rebuild: install stop start

all : build up
DC = docker-compose

build:
	$(DC) -f ./srcs/docker-compose.yml build

up:
	$(DC) -f ./srcs/docker-compose.yml up -d

down:
	$(DC) -f ./srcs/docker-compose.yml down

start:
	$(DC) -f ./srcs/docker-compose.yml start

restart:
	$(DC) -f ./srcs/docker-compose.yml restart

logs:
	$(DC) -f ./srcs/docker-compose.yml logs -f

exec:
	$(DC) -f ./srcs/docker-compose.yml exec

stop:
	$(DC) -f ./srcs/docker-compose.yml stop

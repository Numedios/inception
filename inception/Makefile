all:	up

up:
			docker-compose -f ./srcs/docker-compose.yml up --build

stop:
			docker-compose -f ./srcs/docker-compose.yml down

clean_volumes:
					docker volume rm $$(docker volume ls -q) || true
					sudo rm -rf /home/sbelabba/data/mariadb/* 
					sudo rm -rf /home/sbelabba/data/wordpress/*

prune:
			docker system prune -a
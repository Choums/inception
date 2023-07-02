install :
	@if [ ! -d /home/${USER}/data ]; then \
		echo "Creation du dossier volumes ! OK ";\
		mkdir /home/${USER}/data;\
	fi
	@if [ ! -d /home/${USER}/data/mariadb ]; then \
		echo "Creation du dossier mariadb ! OK ";\
		mkdir /home/${USER}/data/mariadb;\
	fi
	@if [ ! -d /home/${USER}/data/wordpress ]; then\
		echo "Creation du dossier wordpress ! OK ";\
		mkdir /home/${USER}/data/wordpress;\
	fi

	@docker compose -f ./srcs/docker-compose.yml up -d --build

up :
	@docker compose -f ./srcs/docker-compose.yml up -d

stop :
	@docker compose -f ./srcs/docker-compose.yml stop

down :
	@docker compose -f ./srcs/docker-compose.yml down

rm :
	@docker compose -f ./srcs/docker-compose.yml down
	@docker volume rm srcs_wpdata srcs_dbdata
	@docker rmi -f srcs-wordpress srcs-mariadb srcs-nginx 
	@sudo rm -rf /home/${USER}/data

execWP :
	@docker exec -ti wordpress /bin/sh

execDB:
	@docker exec -ti mariadb /bin/sh

execNginx:
	@docker exec -ti nginx /bin/sh

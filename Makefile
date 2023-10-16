init:
	chmod +x init.sh && ./init.sh
start:
	docker-compose up
start-d:
	docker-compose up -d
start-db:
	docker-compose up -d --build
restart-db:
	docker-compose down && docker-compose up -d --build
restart-d:
	docker-compose down && docker-compose up -d
down:
	docker-compose down
volume:
	docker volume prune
	
.PHONY: build-front

.PHONY: pull-all
pull-all:
	for dir in dawaa; do \
		cd $$dir && \
		git checkout development && \
		git pull && \
		cd .. ; \
	done
.PHONE: clean_branches
clean_branches:
	git branch | grep -v "development" | grep -v "main" | xargs git branch -D

# Define the container and database information
CONTAINER_NAME = dawaa_db
DB_USER = root
DB_PASSWORD = root
DB_NAME = dawaa

# Path to the SQL file to import
SQL_FILE = dawadb.sql
install: 
	docker exec -it dawaa_app composer install ; \
	docker exec -it dawaa_app cp .env.example .env ; \
	docker exec -it dawaa_app php artisan key:generate ; \
	docker-compose exec "$(CONTAINER_NAME)" mysql -u"$(DB_USER)" -p"$(DB_PASSWORD)" "$(DB_NAME)" < "$(SQL_FILE)" ; \
	sudo chown -R www-data.www-data storage ; \
	sudo chown -R www-data.www-data bootstrap/cache
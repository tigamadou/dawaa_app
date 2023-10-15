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
install: 
	docker exec -it dawaa_app composer install ; \
	docker exec -it dawaa_app cp .env.example .env ; \
	docker exec -it dawaa_app php artisan key:generate ; \
	docker exec -it dawaa_app php artisan migrate ; 
	sudo chown -R www-data.www-data storage ; \
	sudo chown -R www-data.www-data bootstrap/cache
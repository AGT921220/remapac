include .env

 example:
	@echo ${SERVER_PASS};
up:
	@docker compose down;\
	docker-compose up -d
staging:
	@docker compose down;\
	docker compose -f docker-compose-staging.yml up -d;
down:
	@docker compose down
down-staging:
	@docker compose -f docker-compose-staging.yml down;
install:
	echo "Docker Exec";\
	docker exec -it php-${PROJECT_NAME} composer install
enter:
	docker exec -it php-${PROJECT_NAME} /bin/bash;
nginx:
	docker exec -it nginx-${PROJECT_NAME} /bin/sh;
qa-code-metrics:
	@php artisan qa;
test:
	@./vendor/bin/phpunit

# restart-database-testing:
# 	@php artisan migrate:rollback --env=testing;\
# 	php artisan migrate --env=testing;\
# 	php artisan initial_setup_test --env=testing;\
# 	php artisan db:restore-config

restart-database-testing:
	@docker exec -i mysql-${PROJECT_NAME} mysql -u user -ppassword -e "DROP DATABASE IF EXISTS testing; CREATE DATABASE testing;"
	@docker exec -i mysql-${PROJECT_NAME} mysql -u user -ppassword testing < testing_db.sql

restart-database-github-action:
	@docker exec -i mysql-${PROJECT_NAME} mysql -u user -ppassword -e "DROP DATABASE IF EXISTS db; CREATE DATABASE db;"
	@docker exec -i mysql-${PROJECT_NAME} mysql -u user -ppassword db < testing_db.sql

#Agregar migraciones a base de datos de Testing
migrate-testing:
	@php artisan migrate --env=testing

#Exporta la base de datos de Testing
create-testing-db:
	@if [ -f testing_db.sql ]; then \
		mkdir -p storage/testing; \
		mv testing_db.sql storage/testing/testing_db_$(shell date +%Y%m%d%H%M%S).sql; \
	fi
	@docker exec -i mysql-${PROJECT_NAME} mysqldump -u user -ppassword db > testing_db.sql

restart-testing-db:
	@docker exec -i mysql-${PROJECT_NAME} mysql -u user -ppassword -e "CREATE DATABASE testing;"


clear:
	@docker exec -it php-${PROJECT_NAME} /bin/bash -c "php artisan config:cache && php artisan cache:clear && php artisan config:clear && php artisan horizon:purge && php artisan horizon:terminate && php artisan queue:restart && php artisan route:clear && php artisan route:cache"
deploy:
	@docker exec -it php-${PROJECT_NAME} /bin/bash -c "php artisan config:clear && php artisan config:cache"

qa/full-report:
	@mkdir -p build/phpmd && mkdir -p build/phpcs && mkdir -p build/coverage-report &&\
	php -d pcov.enabled=1 -dpcov.directory=./app vendor/bin/phpunit --coverage-html=./build/coverage-report && \
	vendor/bin/phpmd app html phpmd.xml --reportfile build/phpmd/phpmd.html --ignore-violations-on-exit && \
	vendor/bin/phpcs --report=summary --report-file=./build/phpcs/phpcs_summary.txt --runtime-set ignore_errors_on_exit 1 --runtime-set ignore_warnings_on_exit 1 app && \
	vendor/bin/phpcs --report=source --report-file=./build/phpcs/phpcs_source.txt --runtime-set ignore_errors_on_exit 1 --runtime-set ignore_warnings_on_exit 1 app && \
	vendor/bin/phpcs --report=full --report-file=./build/phpcs/phpcs_full.txt --runtime-set ignore_errors_on_exit 1 --runtime-set ignore_warnings_on_exit 1 app;

coverage:
	@php -d memory_limit=512M -d xdebug.mode=coverage vendor/bin/phpunit --coverage-clover='build/coverage-report/coverage.xml' --coverage-html='build/coverage-report'

server-enter:
	@ssh root@${SERVER_IP}
staging/server-enter:
	@ssh root@${SERVER_IP_STAGING}


coverage-report:
	@./vendor/bin/phpunit --coverage-html build/coverage-report
check-namespaces:
	@php artisan check_namespaces
utils/paste-master:
	@CURRENT_BRANCH=$$(git rev-parse --abbrev-ref HEAD); \
    git checkout master; \
    git pull origin master; \
    git checkout $$CURRENT_BRANCH; \
    git merge master;
ngrok:
	@ngrok http --host-header=rewrite http://localhost:${PORT_NGINX} --response-header-add="Access-Control-Allow-Origin: *";
pull-images-server:
	scp -r root@$(SERVER_IP):/home/remapac/public/images ./public
push-images-server:
	scp -r ./public/images root@$(SERVER_IP):/home/remapac/public

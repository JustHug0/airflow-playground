## Удалить все созданные контейнеры
`docker ps -a | grep 'airflow-test-' | awk '{print $1}' | xargs docker rm -f`

## Удалить данные Postgres, к-ю использует Airflow для хранения данных
`sudo rm -rf /home/east/prjct/airflow-test/pgdata`

## Удалить данные Postgres, используемую в качестве имитации источника данных
`sudo rm -rf /home/east/prjct/airflow-test/pgdata-source`

## Данные для подключения к GreenPlum
user: gpadmin
password: pivotal

## Данные для подключения к Postgres Source
user: gpadmin
password: pivotal

## Логин и пароль в интерфейс Airflow
user: airflow
password: airflow
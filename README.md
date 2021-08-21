# README

## How to contribute

You can run this app (include rails and db) by following command.

```
docker-compose up
```

if you can't find "nekoquest_development" database.
you can create database by following command.

and Migrations are pending. To resolve this issue, run: bin/rails db:migrate RAILS_ENV=development

```
docker-compose run web rails db:create
docker-compose run web rails db:migrate
```

and you should install all used gems, so exec command following.

```
docker-compose run web bundle install
```


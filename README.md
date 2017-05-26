# Working notes...

### Generate Digital Ocean token
- https://cloud.digitalocean.com/settings/api/tokens?i=6dc247

### Dockerizing existing application:
- https://docs.docker.com/machine/examples/ocean/
- http://staxmanade.com/2016/07/run-multiple-docker-environments--qa--beta--prod--from-the-same-docker-compose-file-/
- http://chrisstump.online/2016/02/20/docker-existing-rails-application/

### Covers setting up Digital Ocean docker machine; otherwise use a different docker compose guide (links above)
- https://coderjourney.com/docker-for-development/
- https://coderjourney.com/deploy-docker-digital-ocean/
- https://coderjourney.com/convert-rails-app-to-docker/

### Useful gems

- http://blog.planetargon.com/entries/8-useful-ruby-on-rails-gems-we-couldnt-live-without
    - Pundit – User Authorization
    - WebPacker – Javascript Management
    - Smarter CSV – CSV Import
    - Bundler – Audit
    - Rails ERD – ActiveRecord Diagrams
    - Chartkick – Chart Creator
    - Annotate – Annotate Rails Classes
    - hobo_fields (annotate adds comments from the schema. hobo_fields creates migrations from models.)
    - MetaTags – SEO-Friendly Rails Apps


### CI with Digital Ocean

http://staxmanade.com/2016/07/run-multiple-docker-environments--qa--beta--prod--from-the-same-docker-compose-file-/

### Postgres local install

    /Library/PostgreSQL/9.6
    /Library/PostgreSQL/9.6/data
    port 5432

### Rails app

    .ruby-version 2.4.1
    gem install rails -v 5.0.0 # to match Spree's rails version

### Troubleshooting pg gem failing to install

- https://wikimatze.de/installing-postgresql-gem-under-ubuntu-and-mac/
    PATH=$PATH:/Library/PostgreSQL/9.6/bin gem install pg -v '0.20.0'

### Create rails application (version specific)

    rails _5.0.0_ new hotroll --database=postgresql


### Now need to setup docker and connect to DB!
- http://chrisstump.online/2016/02/20/docker-existing-rails-application/

    $ docker-compose build ruby
    $ docker-compose build
    $ docker-compose run app bundle install
    $ docker-compose run app rake db:create db:migrate
    $ docker-compose run app rake db:drop db:create db:migrate

### Added Spree (it adds Devise as well; no need to install Devise separately)

    $ docker-compose run app rails g spree:install --user_class=Spree::User
    $ docker-compose run app rails g spree:auth:install
    $ docker-compose run app rails g spree_gateway:install
    $ docker-compose run app rake db:migrate

    $ docker-compose up -d

### Accessing shell

    $ docker exec -it app /bin/bash
    $ docker-compose run web /bin/bash

### Seed Spree again after db wipeout

    $ docker-compose run app bundle exec rake railties:install:migrations
    $ docker-compose run app bundle exec rake db:migrate
    $ docker-compose run app bundle exec rake db:seed
    $ docker-compose run app bundle exec rake spree_sample:load

### Encrypt with SSL

- http://chrisstump.online/2016/05/05/lets-encrypt-docker-rails/
chrome://flags/#allow-insecure-localhost


### Multple environments

- http://staxmanade.com/2016/07/run-multiple-docker-environments--qa--beta--prod--from-the-same-docker-compose-file-/

### Omniauth

- http://tgib23.github.io/blog/2016/11/10/how-to-use-omniauth-plus-devise-on-rails5/



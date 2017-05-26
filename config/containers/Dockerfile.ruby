# Base our image on an official, minimal image of our preferred Ruby
FROM ruby:2.4.1-slim

# Install essential Linux packages
RUN sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ jessie-pgdg main" >> /etc/apt/sources.list.d/pgdg.list'
RUN apt-get update -qq && \
    apt-get install -y --force-yes build-essential \
                                   libmagick++-dev \
                                   imagemagick \
                                   git \
                                   libpq-dev \
                                   postgresql-client-9.6 \
                                   nodejs

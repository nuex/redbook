redbook
=======

Redbook is a rails app

## Setup

Ensure you have Docker and docker-compose installed on your machine.

Then, run the following:

```
docker-compose run --rm app bundle
docker-compose run --rm app bundle exec rake db:setup
docker-compose up
```

The app should be running at `http://localhost:3000`.

# COPS

COPS is an online platform that allows IS and its vendors an easy and efficient way to store and retrieve data related to the IS Carrier network, enabling engineers and management to make the correct decision at the correct time, leading to improved network availability and decreased costs.

## Prerequisites

You will need the following installed:

* Foreman ([https://github.com/ddollar/foreman](https://github.com/ddollar/foreman))

* Watchman ([https://facebook.github.io/watchman/docs/install.html](https://facebook.github.io/watchman/docs/install.html))
``` bash
$ brew install watchman
```

* Please upgrade Sass locally to the latest version or a version > 3.4.4

## Setup

COPS relies on the `cops.dev` development domain. To run this, install pow from `get.pow.cx`

``` bash
$ curl get.pow.cx | sh
```

COPS includes a setup script to get your development environment set up. Just run:

``` bash
$ bin/setup
```

To start the app, use foreman

``` bash
$ foreman start
```

## Testing

The backend and frontend have their own testing frameworks setup. Run both of them as follows:

```bash
$ bin/test
```

##Environment variables
Check the .env file,  if you want to ignore the changes in your .env, use `git update-index --assume-unchanged .env`

* DB_HOST
* DB_DB
* SECRET_KEY_BASE
* SSO_CONSUMER_KEY
* SSO_CONSUMER_SECRET
* SIAUTH_KEY
* SENTRY_DSN
* API_PORT
* EMBER_PORT
* PROXY_PORT
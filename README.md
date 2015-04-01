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

* IRuby Notebook (Optional: Install it if you want to run the project's iruby notebooks)
``` bash
$ brew install zeromq
$ pip install "ipython[notebook]"
$ gem install iruby

# to run iruby notebook
$ iruby notebook
```

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

##Docker
To create and run a docker container suitable for local usage, you will need docker installed
and you will need to install decking globally.

`npm install -g decking`
`decking build all`
`decking create main`
`decking start main`

Now you should be able to navigate to your IP or the boot2docker VM's IP and view COPS

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
* PM_WSDL
* PM_ADMIN_USER
* PM_ADMIN_PASSWORD
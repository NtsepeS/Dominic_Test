# COPS

COPS is an online platform that allows IS and its vendors an easy and efficient way to store and retrieve data related to the IS Carrier network, enabling engineers and management to make the correct decision at the correct time, leading to improved network availibility and decreased costs.

## Setup

COPS relies on the `cops.dev` development domain. To run this, install pow from `get.pow.cx`

``` bash
$ curl get.pow.cx | sh
```

COPS includes a setup script to get your development environment set up. Just run:

``` bash
$ bin/setup
```

To start the app, just use foreman

``` bash
$ foreman start
```

## Testing

The backend and frontend have their own testing frameworks setup. Run both of them as follows:

```bash
$ bin/test
```


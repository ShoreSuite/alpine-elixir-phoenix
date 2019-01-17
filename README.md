alpine-elixir-phoenix
===

alpine-elixir-phoenix Docker image builder, largely based on [bitwalker/alpine-elixir-phoenix](https://github.com/bitwalker/alpine-elixir-phoenix) but using [shoresuite/alpine-elixir](https://github.com/ShoreSuite/alpine-elixir) as the base image.

## Usage Instructions

To simply use the latest, published Docker image

```
docker pull shoresuite/alpine-elixir-phoenix
```

However, it's recommended that you specify the exact image version (based on Elixir version)

```
docker pull shoresuite/alpine-elixir-phoenix:1.8.0
```

## Build Instructions

To build and tag the image yourself locally, first clone this repository then

```
ELIXIR_VERSION=$(cat VERSION|tr -d '\n'); docker build -t alpine-elixir-phoenix:${ELIXIR_VERSION} --build-arg ELIXIR_VERSION=${ELIXIR_VERSION} .
```

You may also try to build using an older version of `shoresuite/alpine-elixir`, by supplying your own value for `ELIXIR_VERSION`. For example

```
ELIXIR_VERSION='1.7.4'; docker build -t alpine-elixir-phoenix:${ELIXIR_VERSION} --build-arg ELIXIR_VERSION=${ELIXIR_VERSION} .
```

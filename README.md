# statsite for wake

This repo is intended to be used with the deployment tool wake during
`wake-host-images-create` to be included as a running container on every
host.

## Build the containers

```sh
$ wake containers create -r master
```

Or to push it to docker hub:

```sh
$ wake containers create -r master -p
```

## Use locally

```sh
$ docker run -d --name statsite org/wake-statsite:sha
```

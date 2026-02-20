# `Docker`

<h2>Table of contents</h2>

- [Image](#image)
- [Container](#container)
- [Install `Docker`](#install-docker)
- [What is `Docker`](#what-is-docker)
  - [`docker run`](#docker-run)
  - [`docker ps`](#docker-ps)
- [`Docker Compose`](#docker-compose)
  - [Service](#service)
- [Volumes](#volumes)
- [Health checks](#health-checks)

## Image

<!-- TODO -->

## Container

<!-- TODO define dependencies -->
<!-- TODO define runtime -->
<!-- TODO define isolated -->
<!-- TODO provide link to definitions web page -->

A container is an isolated runtime for an application and its dependencies.

Why containers are useful:

- The app runs consistently across machines.
- Dependencies are packaged with the app.
- Multiple services can run side-by-side with explicit ports and networks.

Example of how containers fit together:

```text
-------------------- Docker host --------------------
|                                                     |
|  ------------ container ------------               |
|  | Linux userspace runtime         |               |
|  | app/service process             |               |
|  ----------------------------------               |
|                                                     |
|  ------------ container ------------               |
|  | Linux userspace runtime         |               |
|  | another app/service process     |               |
|  ----------------------------------               |
|                                                     |
-------------------------------------------------------
```

<!-- TODO image -->

## Install `Docker`

1. Follow the [installation instructions](https://docs.docker.com/get-started/get-docker/).

## What is `Docker`

`Docker` is a platform for building and running [containers](#container).

### `docker run`

`docker run` starts a container from an image.

Common pattern:

```terminal
docker run --name <container-name> -p <host-port>:<container-port> <image-name>
```

Useful flags:

- `-d` - run in background (detached mode).
- `--rm` - remove container after it exits.
- `-e KEY=VALUE` - pass environment variable.

### `docker ps`

`docker ps` shows running containers.

Useful variants:

```terminal
docker ps
docker ps -a
```

- `docker ps` - only running containers.
- `docker ps -a` - all containers (including stopped).

## `Docker Compose`

`Docker Compose` runs multi-container apps from a `docker-compose.yml` file.

See [`Docker Compose`](./docker-compose.md) for the full list of commands.

### Service

A service is a named entry under the `services:` key in `docker-compose.yml`. It defines how to build or pull an [image](#image) and run it as a [container](#container).

For example, this project defines four services in [`docker-compose.yml`](../../docker-compose.yml): `app`, `postgres`, `pgadmin`, and `caddy`.

## Volumes

A volume is persistent storage managed by `Docker`. Data in a volume survives container restarts.

Volumes are defined in `docker-compose.yml`:

```yaml
volumes:
  postgres_data:
```

A service can mount a volume to store data:

```yaml
services:
  postgres:
    volumes:
      - postgres_data:/var/lib/postgresql/data
```

## Health checks

A health check is a command that `Docker` runs periodically to check if a container is healthy.

Other services can wait for a container to be healthy before starting:

```yaml
services:
  app:
    depends_on:
      postgres:
        condition: service_healthy

  postgres:
    healthcheck:
      test: ["CMD-SHELL", "pg_isready -U postgres"]
      interval: 5s
      timeout: 5s
      retries: 5
```

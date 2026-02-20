# Useful programs

<h2>Table of contents</h2>

## `curl`

`curl` is a command-line tool for transferring data with URLs, commonly used to send `HTTP` requests.

### Send a `GET` request with `curl`

```terminal
curl <url>
```

Example:

```terminal
curl http://127.0.0.1:8080/status
```

### Common `curl` flags

| Flag | Description |
| ---- | ----------- |
| `-s` | Silent — suppresses progress output. Useful when piping to [`jq`](#jq). |
| `-X <method>` | Set the `HTTP` method (e.g., `-X POST`). |
| `-H <header>` | Add a request header (e.g., `-H "Authorization: Bearer <token>"`). |
| `-d <data>` | Send a request body (e.g., `-d '{"key": "value"}'`). |

## `git`

## `source`

## `bash`

## `jq`

## `find`

## `ripgrep`

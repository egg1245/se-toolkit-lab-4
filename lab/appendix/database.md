# Database

<h2>Table of contents</h2>

- [What is a database](#what-is-a-database)
- [Database server](#database-server)
- [`PostgreSQL`](#postgresql)
- [`PgAdmin`](#pgadmin)
  - [Open `PgAdmin`](#open-pgadmin)
  - [Add a server in `PgAdmin`](#add-a-server-in-pgadmin)
  - [Browse tables](#browse-tables)
  - [Run a query](#run-a-query)
- [SQL basics](#sql-basics)
  - [`SELECT`](#select)
  - [`INSERT`](#insert)
  - [`WHERE`](#where)
- [Database schema](#database-schema)
- [Resetting the database](#resetting-the-database)

## What is a database

A database is an organized collection of data that can be accessed, managed, and updated.

Databases store data in structures such as tables (rows and columns).

## Database server

A database server is software that manages one or more databases and handles queries from clients (applications).

Examples of database servers: `PostgreSQL`, `MySQL`, `SQLite`.

## `PostgreSQL`

`PostgreSQL` is a popular open-source relational database server.

Docs:

- [Official PostgreSQL docs](https://www.postgresql.org/docs/)

## `PgAdmin`

`PgAdmin` is a web-based graphical tool for managing `PostgreSQL` databases.

It lets you browse tables, run SQL queries, and inspect the database schema.

Docs:

- [Official PgAdmin docs](https://www.pgadmin.org/docs/)

### Open `PgAdmin`

1. Open <http://127.0.0.1:5050> in a browser.
2. Log in with the credentials from `.env.docker.secret`:
   - Email: the value of `PGADMIN_EMAIL` (default: `admin@example.com`).
   - Password: the value of `PGADMIN_PASSWORD` (default: `admin`).

### Add a server in `PgAdmin`

1. [Open `PgAdmin`](#open-pgadmin).
2. Right-click `Servers` in the left panel.
3. Click `Register` -> `Server...`.
4. In the `General` tab:
   - Name: `lab3`.
5. In the `Connection` tab:
   - Host name/address: `postgres`.
   - Port: `5432`.
   - Username: the value of `POSTGRES_USER` (default: `postgres`).
   - Password: the value of `POSTGRES_PASSWORD` (default: `postgres`).
6. Click `Save`.

> [!IMPORTANT]
> The host name is `postgres`, not `localhost`.
> This is because `PgAdmin` and `PostgreSQL` run in separate `Docker` containers.
> `Docker Compose` creates a network where services can reach each other by their service name.

### Browse tables

1. [Add a server](#add-a-server-in-pgadmin) if you haven't already.
2. Expand: `Servers` -> `lab3` -> `Databases` -> `lab3` -> `Schemas` -> `public` -> `Tables`.
3. Right-click a table -> `View/Edit Data` -> `All Rows`.

### Run a query

1. [Add a server](#add-a-server-in-pgadmin) if you haven't already.
2. Click on the `lab3` database.
3. Click `Tools` -> `Query Tool`.
4. Write your SQL query, e.g.:

   ```sql
   SELECT * FROM interaction_logs WHERE item_id = 2;
   ```

5. Click the `Execute` button (or press `F5`).

## SQL basics

### `SELECT`

Retrieve data from a table:

```sql
SELECT * FROM items;
```

Retrieve specific columns:

```sql
SELECT title, description FROM items;
```

### `INSERT`

Add a new row to a table:

```sql
INSERT INTO items (title, description) VALUES ('New Item', 'A description.');
```

### `WHERE`

Filter rows by a condition:

```sql
SELECT * FROM learners WHERE enrolled_at >= '2025-10-01';
```

## Database schema

The database schema defines the structure of the database: tables, columns, data types, and constraints.

You can inspect the schema of a table in `PgAdmin`:

1. Expand the table in the left panel.
2. Expand `Columns` to see column names and types.

> [!NOTE]
> The column names in the database must match the field names in the `Python` code.
> If they don't match, the application will fail to read data from the database.

## Resetting the database

The database is initialized from the file `src/app/data/init.sql` on the first start of the `PostgreSQL` container.

To reset the database to its initial state:

1. [Run using the `VS Code Terminal`](./vs-code.md#run-a-command-using-the-vs-code-terminal):

   ```terminal
   docker compose --env-file .env.docker.secret down -v
   ```

2. This removes the database volume. The next `docker compose up` will re-create the database from `init.sql`.

3. Start the services again:

   ```terminal
   docker compose --env-file .env.docker.secret up --build
   ```

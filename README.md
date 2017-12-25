# Accreation

A simple data warehousing ingestion API.

## Format

A POST-Only api with the target ingest collection set as the only path parameter.

Example:

```
POST http://<server_address>/warehouse/<collection_name>

(adds POST request body as a document to Collection <collection_name>)
```

## Docker Compose

Please find included a `docker-compose.yml` file for local testing.

If the defaul local backend DB connection will not be used, pass a parameter:
```
CREDENTIALS_SPEC=<file_name>
```
to define and configure credentials for the backend connection.

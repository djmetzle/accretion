# Accretion

A simple data warehousing ingestion API.

## Format

A POST-Only api with the target ingest collection set as the only path parameter.

Example:

```
POST http://<server_address>/warehouse/<collection_name>

```

This adds the POST request body to Collection <collection_name>).

Note: payloads should be JSON encoded.

## Validation

Collection names should be lowercase alphabet characters only.
Underscores can be used. All other formats will be forced 
to lowercase alpha + `_`.

## Docker Compose

Please find included a `docker-compose.yml` file for local testing.

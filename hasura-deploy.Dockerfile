FROM hasura/graphql-engine:v2.33.0.cli-migrations-v3

COPY ./hasura/metadata/ /hasura-metadata
COPY ./hasura/migrations/ /hasura-migrations

CMD graphql-engine \
  --metadata-database-url $HASURA_GRAPHQL_DATABASE_URL \
  serve \
  --server-port $PORT \
  --enable-console

#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" template1 <<-EOSQL
	CREATE EXTENSION citext;
	CREATE USER sentry WITH PASSWORD 'c2VudHJ5Cg==';
	ALTER USER sentry WITH superuser;
	CREATE DATABASE sentry WITH OWNER sentry;
EOSQL

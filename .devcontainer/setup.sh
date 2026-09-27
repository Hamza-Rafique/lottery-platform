#!/usr/bin/env bash
set -e

echo "==> Installing global tools..."
npm i -g @nestjs/cli prisma expo-cli

echo "==> Waiting for PostgreSQL..."
until pg_isready -h localhost -p 5432; do sleep 1; done

echo "==> Creating databases..."
psql -h localhost -U postgres -c "CREATE DATABASE lottery_dev;" || true
psql -h localhost -U postgres -c "CREATE DATABASE lottery_test;" || true

echo "==> Ready. Run 'code .' or start developing."
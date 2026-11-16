#!/usr/bin/env bash
[ ! -f .env ] && cp .env.example .env
docker compose up -d
sleep 4
open "http://localhost:8888/lab"

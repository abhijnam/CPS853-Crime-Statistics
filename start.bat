@echo off
if not exist .env copy .env.example .env
docker compose up -d
timeout /t 6 /nobreak >nul
start "" "http://localhost:8888/lab"
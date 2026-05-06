#!/bin/bash

echo "Starting Healthcare IoT Honeypot..."

if ! command -v docker &> /dev/null
then
    echo "Docker is not installed."
    exit 1
fi

if ! command -v docker-compose &> /dev/null
then
    echo "Docker Compose is not installed."
    exit 1
fi

unset DOCKER_HOST
unset DOCKER_TLS_VERIFY
unset DOCKER_CERT_PATH

docker-compose down

if ! docker-compose up -d --build
then
    echo "Docker Compose failed."
    exit 1
fi

echo ""
echo "Honeypot Running!"
echo "SSH    : localhost:2222"
echo "Telnet : localhost:2223"
echo ""

docker-compose ps

#!/bin/bash

set -e

DIR=./minetest
GAMES="$DIR/games"

dc="docker compose"

function start() {
    stop
    $dc pull
    $dc up --build -d
}

function stop() {
    if [ $($dc ps | wc -l) -gt 2 ]; then
        $dc down
    fi
}

function setup() {
    mkdir -p "$GAMES"
    wget https://content.minetest.net/packages/Wuzzy/mineclone2/releases/16650/download/ -O mineclone2.zip
    unzip mineclone2.zip -d "$GAMES"
}

case $1 in
    "start")
        start
        ;;
    "stop")
        stop
        ;;
    "setup")
        setup
        ;;
esac
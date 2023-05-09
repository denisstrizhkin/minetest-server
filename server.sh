#!/bin/bash

set -e

DIR=./minetest
GAMES="$DIR/games"

dc="docker compose"
gs="git submodule"

function start() {
    stop
    $dc pull
    $dc up --build -d
}

function stop() {
    $dc down
}

function setup() {
    $gs init
    $gs update
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

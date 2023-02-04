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
    if [ $($dc ps | wc -l) -gt 2 ]; then
        $dc down
    fi
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
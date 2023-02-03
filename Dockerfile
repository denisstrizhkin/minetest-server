FROM lscr.io/linuxserver/minetest:latest

WORKDIR /config/.minetest

COPY ./minetest/games games
COPY ./minetest/main-config main-config
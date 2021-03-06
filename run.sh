#!/bin/sh

# Run selenium container.
docker run --restart=always --name=selenium_chrome -d -v /dev/shm:/dev/shm selenium/standalone-chrome
# Pause for 1 second to give selenium time to start properly.
sleep 1s
# Start behat container.
docker run -ti --rm --name=docker_behat --link selenium_chrome -v $(pwd):/srv bergil/docker-behat
# Stop and remove selenium container.
docker rm -f selenium_chrome

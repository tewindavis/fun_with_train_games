#!/bin/bash

docker build --tag db .
docker run -it --mount type=bind,source="$(pwd)"/Database,target=/db/ db
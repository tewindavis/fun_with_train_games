# operating system
FROM ubuntu:18.04

# update and install needed software
RUN apt-get -y update
RUN apt-get -y upgrade
RUN apt-get install -y python3.7
RUN apt-get install -y python3-pip
RUN apt-get install -y sqlite3 libsqlite3-dev

# copy over files
RUN mkdir /db_init
COPY ./Database /db_init/db
COPY ./GameDataCSVs /db_init/csv
COPY ./Code /db_init/code


# link up file system

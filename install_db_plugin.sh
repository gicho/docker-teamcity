#!/bin/bash
set -e

if [ -n "$DATABASE" ]; then
    mkdir -p $TEAMCITY_DATA_PATH/lib/jdbc

    case "$DATABASE" in
    "POSTGRES" )
        if [ ! -f "$TEAMCITY_DATA_PATH/lib/jdbc/postgresql-9.4.1208.jar" ]; then
            echo Downloading postgresql-9.4 driver
            wget -P $TEAMCITY_DATA_PATH/lib/jdbc https://jdbc.postgresql.org/download/postgresql-9.4.1208.jar
        fi ;;
    * )
        echo Usupported database: $DATABASE && exit 1;;
    esac

else
    echo Using no database;
fi


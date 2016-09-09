#!/bin/bash

# This script will iterate through all laravel/lumen projects in a directory and run
# the migrations and seeders for each. If you pass an argument, it will navigate to
# the given directory, otherwise it will perform the operation on the current directory.

# put this file in your ~/.homestead/ directory

function err_message {
    if [ $# -gt 0 ]; then
        errmessage=$1
    else
        errmessage="There was an error"
    fi

    echo -e "\e[31m$errmessage\e[0m" 1>&2
}

function success_message {
    if [ $# -gt 0 ]; then
        message=$1
    else
        message="Success"
    fi

    echo -e "\e[32m$message\e[0m"
}

if [ $# -gt 0 ] && ! cd $1 ; then
    err_message "Could not navigate to $1"
    exit
fi

for proj in $( ls ); do

    if [ -d $proj ] && [ -e "$proj/artisan" ]; then
        echo "Setting up $proj..."

        if ! cd $proj ; then
            err_message "Problem navigating to $proj";
            continue;
        fi

        projerror=0

        if ! php artisan migrate ; then
            err_message "Problem with $proj migration"
            projerror=1
        fi

        if ! php artisan db:seed ; then
            err_message "Problem seeding $proj"
            projerror=1
        fi

        if [ $projerror -eq 0 ]; then
            success_message "DB setup for $proj complete"
        fi

        cd ..
    fi
done

echo "Done"
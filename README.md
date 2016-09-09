# Laravel Homestead DB Setup

Do you have a lot of Laravel projects on one Homestead instance? It's kind
of a pain to run the migrations for all of them isn't it? Well this script
will automatically run all of your projects migrations when Vagrant starts
or provisions the VM.

## Instructions

1. Copy and paste the line of code in this project's after.sh into your after.sh (or just copy the whole file)
2. Make sure all of your laravel projects are in the same directory on your Homestead machine
3. Copy and paste the copy command at the bottom of this project's Homestead.yaml into yours
4. Put the migrate-all.sh file into your ~/.homestead/ directory

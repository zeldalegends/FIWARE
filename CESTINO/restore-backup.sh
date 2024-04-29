#!/bin/bash

# Utility to restore the idm db and revert it to the backup in mysql-data folder

cat backup.sql | docker exec -i db-mysql /usr/bin/mysql -u root --password=secret idm

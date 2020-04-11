#!/bin/bash

psql --username postgres -a -f "${1}"/copy_user.sql
psql --username postgres -a -f "${1}"/q9.sql
psql --username postgres -a -f "${1}"/q10.sql
psql --username postgres -a -f "${1}"/q11.sql
psql --username postgres -a -f "${1}"/q12.sql
psql --username postgres -a -f "${1}"/q13.sql

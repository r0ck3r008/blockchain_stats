#!/bin/bash

psql --username postgres -a -f "${1}"/q1.sql
psql --username postgres -a -f "${1}"/q2.sql
psql --username postgres -a -f "${1}"/q3.sql
psql --username postgres -a -f "${1}"/q4.sql
psql --username postgres -a -f "${1}"/q5.sql
psql --username postgres -a -f "${1}"/q6.sql
psql --username postgres -a -f "${1}"/q7.sql
psql --username postgres -a -f "${1}"/q8.sql
psql --username postgres -a -f "${1}"/input_creator.sql

#!/bin/bash
echo "[sqlagent]" >> /var/opt/mssql/mssql.conf
echo "enabled = true" >> /var/opt/mssql/mssql.conf
/opt/mssql/bin/sqlservr

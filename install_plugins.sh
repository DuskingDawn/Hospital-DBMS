#!/bin/bash
set -e

# Wait for MySQL to start
until mysql -u root -p"${MYSQL_ROOT_PASSWORD}" -e "status" > /dev/null 2>&1; do
  echo "Waiting for MySQL to start..."
  sleep 3
done

# Install the validate_password plugin and keyring component
mysql -u root -p"${MYSQL_ROOT_PASSWORD}" <<-EOSQL
  INSTALL COMPONENT 'file://component_validate_password';
  SET GLOBAL validate_password.policy = LOW;
  SET GLOBAL validate_password.length = 6;
  SET GLOBAL validate_password.mixed_case_count = 0;
  SET GLOBAL validate_password.number_count = 0;
  SET GLOBAL validate_password.special_char_count = 0;

  INSTALL COMPONENT 'file://component_keyring_file';
EOSQL

FROM mysql:latest

# Copy the plugin installation script
COPY install_plugins.sh /docker-entrypoint-initdb.d/

# Copy the manifest file
COPY mysqld.my /etc/mysql/mysqld.my

# Ensure the script is executable
RUN chmod +x /docker-entrypoint-initdb.d/install_plugins.sh

# Set ownership of the MySQL data directory
RUN chown -R mysql:mysql /var/lib/mysql

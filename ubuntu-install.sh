# If you have installed ClickHouse and forgot password you can reset it in the configuration file.
# The password for default user is typically located at /etc/clickhouse-server/users.d/default-password.xml
# and deleting this file will reset the password.
# See also /etc/clickhouse-server/users.xml on the server where ClickHouse is installed.

# To remove clickhouse
# sudo apt autoremove --purge clickhouse-server clickhouse-client

#----

# Below here we attempt to install clickhouse

# configure apt
sudo apt update && sudo apt upgrade -y
sudo apt install dirmngr ca-certificates software-properties-common apt-transport-https curl

# install clickhouse gpg key
gpg --keyserver hkp://keyserver.ubuntu.com:80 --recv 8919F6BD2B48D754
gpg --export --armor 8919F6BD2B48D754 | sudo gpg --dearmour -o /etc/apt/trusted.gpg.d/clickhouse-key.gpg

echo "deb [arch=amd64] https://packages.clickhouse.com/deb stable main" | sudo tee /etc/apt/sources.list.d/clickhouse.list

sudo apt update

sudo apt install clickhouse-server clickhouse-client

# enable clickhouse to start on boot
sudo systemctl enable clickhouse-server


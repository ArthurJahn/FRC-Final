echo "Starting DNSSec server..."
cd dns-server
vagrant up

echo "Catching DNSSec server ip..."
cp dns_server_ip.txt ../client

echo "Starting apache server..."

cd ../webserver
vagrant up

echo "Strating client..."
cd ../client
vagrant up

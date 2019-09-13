sudo su
sudo apt-get install openjdk-8-jdk -y
sudo wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
sudo apt-get install apt-transport-https
echo "deb https://artifacts.elastic.co/packages/6.x/apt stable main" | sudo tee -a /etc/apt/sources.list.d/elastic-6.x.list
sudo apt-get update && sudo apt-get install elasticsearch 
sudo apt-get update && sudo apt-get install logstash
sudo apt-get update && sudo apt-get install kibana
vi /etc/elasticsearch/elasticsearch.yml
sed -i '/cluster.name/ s/^#//' /etc/elasticsearch/elasticsearch.yml
sed -i '/node.name/ s/^#//' /etc/elasticsearch/elasticsearch.yml
sed -i '/network.host/ s/^#//' /etc/elasticsearch/elasticsearch.yml

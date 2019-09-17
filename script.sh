sudo su
sudo apt-get install openjdk-8-jdk -y
sudo wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
sudo apt-get install apt-transport-https
echo "deb https://artifacts.elastic.co/packages/6.x/apt stable main" | sudo tee -a /etc/apt/sources.list.d/elastic-6.x.list
sudo apt-get update && sudo apt-get install elasticsearch 
sudo apt-get update && sudo apt-get install logstash
sudo apt-get update && sudo apt-get install kibana
echo 'export ip='$(hostname -i)'' >> ~/.profile
source ~/.profile
sed -i 's/#cluster.name: my-application/cluster.name: my-cluster' /etc/elasticsearch/elasticsearch.yml
sed -i 's/#node.name: node-1/node.name: test' /etc/elasticsearch/elasticsearch.yml
sed -i 's/#network.host: 192.168.0.1/network.host: '$ip'/' /etc/elasticsearch/elasticsearch.yml
	  

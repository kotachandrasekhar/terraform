sudo su
#source ~/.profile
sudo apt-get install openjdk-8-jdk -y
sudo wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
sudo apt-get install apt-transport-https
sudo echo "deb https://artifacts.elastic.co/packages/6.x/apt stable main" | sudo tee -a /etc/apt/sources.list.d/elastic-6.x.list
sudo apt-get update && sudo apt-get install elasticsearch 
sudo apt-get update && sudo apt-get install logstash
sudo apt-get update && sudo apt-get install kibana
#echo 'export ip='$(hostname -i)'' >> ~/.profile
#source ~/.profile
#echo 'export ip='$(hostname -i)'' >> ~/.bashrc
#source ~/.bashrc
sed -i '/#cluster.name: my-application/c\cluster.name: my-cluster' /etc/elasticsearch/elasticsearch.yml
sed -i '/#node.name: node-1/c\node.name: test' /etc/elasticsearch/elasticsearch.yml
sed -i 's/#network.host: 192.168.0.1/network.host: '$ip'/' /etc/elasticsearch/elasticsearch.yml
#sed -i 's/network.host: /network.host: '$ip'/' /etc/elasticsearch/elasticsearch.yml
echo "server.host: \"$ip\"" >>/etc/kibana/kibana.yml
echo "server.name: \"elkserver\"" >>/etc/kibana/kibana.yml
echo "elasticsearch.hosts: [\"http://$ip:9200\"]" >>/etc/kibana/kibana.yml
	  

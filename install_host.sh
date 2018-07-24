# Install docker

sudo apt update && \
sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common

sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

sudo apt-get update && \
sudo apt-get install -y docker-ce

# Run docker
sudo docker rm $(docker ps -a -q) -f
sudo rm -f /tmp/bioinf.cid
sudo docker run --cidfile /tmp/bioinf.cid -d -p 31000:31000 spacecade7/tutorial_11682_11683:gatk4.0.1.1 sleep infinity
container_id=$(cat /tmp/bioinf.cid)

# Install access
sudo docker cp install_docker.sh $container_id:/install_docker.sh
sudo docker cp nginx.conf $container_id:/nginx.conf
sudo docker exec $container_id bash /install_docker.sh &

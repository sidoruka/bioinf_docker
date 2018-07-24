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
container_id=$(docker run -d -p 31000:31000 spacecade7/tutorial_11682_11683:gatk4.0.1.1 sleep infinity)

# Install access
docker cp install_docker.sh $container_id:/install_docker.sh
docker exec -i $container_id bash /install_docker.sh
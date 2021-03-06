apt-get update -y && \
apt-get install -y  build-essential \
                python \
                wget \
                git \
                sudo \
                nginx && \

mv /nginx.conf /etc/nginx/nginx.conf && \
nginx && \

USERNAME="bioinf" && \
USERPASS=$(date +%s | sha256sum | base64 | head -c 32 ; echo) && \

echo "===Creating user $USERNAME with password $USERPASS===" && \

useradd "$USERNAME" -G root -m && \
echo "$USERNAME:$USERPASS" | chpasswd && \
echo "$USERNAME ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers && \
chown $USERNAME /gatk -R && \
echo "export PATH=$PATH:/gatk" >> /etc/profile && \

echo "============================================================================================" >> /etc/motd && \
echo "Welcome to GATK4 tutorial: \"Sensitively detect copy ratio alterations and allelic segments\"" >> /etc/motd && \
echo "" >> /etc/motd && \
echo "Original tutorial is located at: https://gatkforums.broadinstitute.org/dsde/discussion/11682" >> /etc/motd && \
echo "" >> /etc/motd && \
echo "Steps 1-4 shall be executed at /gatk/tutorial_11682 folder, e.g.: cd /gatk/tutorial_11682" >> /etc/motd && \
echo "Steps 5-8 shall be executed at /gatk/tutorial_11683 folder, e.g.: cd /gatk/tutorial_11683" >> /etc/motd && \
echo "============================================================================================" >> /etc/motd && \
echo "" >> /etc/motd && \

echo "===Installing node.js===" && \

cd /opt && \
wget https://nodejs.org/dist/v6.11.3/node-v6.11.3-linux-x64.tar.xz && \
tar xvfJ node-v6.11.3-linux-x64.tar.xz && \
rm -f node-v6.11.3-linux-x64.tar.xz && \

export PATH=$PATH:/opt/node-v6.11.3-linux-x64/bin/ && \

echo "===Installing wetty===" && \

cd /opt && \
git clone https://github.com/krishnasrinivas/wetty && \
cd wetty && \
npm install && \

echo "" && \
echo "$USERNAME" && \
echo "$USERPASS" && \
node app.js -p 32000
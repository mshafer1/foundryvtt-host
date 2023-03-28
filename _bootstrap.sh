sudo apt-get install -y \
    make \
    nano \
    nginx \
    python3 \
    python3-pip \
    python3-venv \
    certbot \
    python3-certbot-nginx

sudo curl -sSfL get.docker.com | bash

pip3 install pipx-in-pipx

pipx install docker-compose

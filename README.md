# foundryvtt-host
Config to spin up FoundryVTT in a Docker container with nginx acting as a proxy with SSL

## Getting started:

**PRE-REQUIREMENTS**: 
* FoundryVTT (the Linux/NodeJS option) is downloaded from [foundryvtt.com](https://foundryvtt.com/)
* Domain name pointing at your server (A type record)
* Git installed ([official website](https://git-scm.com/downloads))

&nbsp;

**NOTE**: Only Debian (and derivative) platforms are supported by `_bootstrap.sh`; however, the packages installed are available on many distros. Feel free to edit to utilize your system's package manager.

&nbsp;

1. Clone the repo

    `git clone https://github.com/mshafer1/foundryvtt-host`

1. change-directory into the repo

    `cd foundryvtt-host`

1. Make the bootstrap script executable

    `chmod +x _bootstrap.sh`

1. Use `_bootstrap.sh` to install deps and build container.
   
    `sudo ./_bootsrap.sh`

1. Restart shell (log out and back in, or close and re-open terminal)

1. Place downloaded zip of Foundry Virtual Tabletop in `foundryvtt-host` folder

1. Build the image

    `docker-compose build`

1. Start up a container from the image

    `docker-compose up -d`

1. Check that it worked:

    `curl -v http://localhost:30000` 

    Should see something like "Found. Redirecting to /license"

    (You could also open `http://localhost:3000` in your broser on the server machine)

1. (Optional) Specify the folder for foundry data to go into in a `.env` file

    `echo ROOT_DIR=./foundry_data > .env` (for example)

1. Specify your domain name in `.env`

    `echo DOMAIN=vtt.mywebsite.com >> .env` (change `vtt.mywebsite.com` to your domain name)

1. Use the Makefile to configure nginx to proxy requests for "DOMAIN" to the container:

    `sudo make install`

1. Use certbot to enable SSL.

    `sudo make install_ssl`

1. Check that "DOMAIN" in your browser loads VTT with httpS enabled.

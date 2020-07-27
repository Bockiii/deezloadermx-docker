# deezloadermx-docker

Deezloader Remix in a Docker container.

# Disclaimer

V4.4.0 is the last version of Deezloader Remix! The devs are working on a successor, where I am also providing a docker container for.

Find the successor here: 
    Repo: https://notabug.org/RemixDev/deemix
    Docker: https://gitlab.com/Bockiii/deemix-docker

This will be the last update to the container and I removed the dev tag as well (as there is no development anymore)

## How to run this

Deezloader Remix will work out of the box, but you should at least set a fixed port for the web interface and mount a folder to the container for where your downloads will go.

You can also map a folder on the host for the config file (mount a local folder to /config/), but that's optional. If they add or rework settings in the future, there is no guarantee that your old configs will work, so beware.

### Example for Docker:
```
$ docker run -d --name Deezldr \
              -v /your/storage/path/:/downloads \
              -v /your/config/location:/config \
              -e PUID=1000 \
              -e PGID=1000 \
              -p 1730:1730 \
              bocki/deezloaderrmx
```

### Example for Docker Compose:
```
version: '3.3'
services:
    deezloaderrmx:
	    image: bocki/deezloaderrmx
        container_name: Deezldr
        volumes:
            - /your/storage/path/:/downloads
            - /your/config/location:/config
        environment:
            - PUID=1000
            - PGID=1000
        ports:
            - 1730:1730
```

### Explanation:

`-v /your/storage/path/:/downloads`     - Path for your music downloads.

`-v /your/config/location:/config`      - OPTIONAL: Path to your local configuration.

`-e PUID=1000`                          - OPTIONAL: User ID of the user you want the container to run as in order to fix folder permission issues.

`-e PGID=1000`                          - OPTIONAL: Group ID, see above.

`-p 1730:1730`                          - Port opened for the web interface.

`bocki/deezloaderrmx`                   - This container.

To access the web interface, go to http://YOURSERVERIP:1730 

## Tags

`latest`                : V4.4.0 of Deezloader Remix

Tag includes `amd64`, `arm32v7` and `arm64v8` architectures. Big thanks to tempestnano on github for the arm containers!

## Disclaimer and Links

I am in no way affiliated with the DeezloaderRMX project (or any other Deezloader project for that matter), I just wanted the challenge to create my first Docker container.

Dockerhub link for this container: https://hub.docker.com/r/bocki/deezloaderrmx

Repo for Deezloader Remix: https://notabug.org/RemixDevs/DeezloaderRemix

Issue Tracker for this Docker: https://github.com/Bockiii/deezloadermx-docker/issues


Feel free to open an issue that is Docker related, and not related to Deezloader development. Their development stopped, so if it's broken, it's broken. Check the successor Deemix (links at the start) for progress.

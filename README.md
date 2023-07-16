# Run manually

Set the forge URL that you want to use in settings.json

Make sure you also create a ./server directory in the project root, the docker will mount and build the server and drop the files there so they are persistant.

```bash
mkdir server
docker build . -t minecraft-forge
docker run -it -p 0.0.0.0:25565:25565/tcp -v ${PWD}/server:/server minecraft-forge
```

# Notes:

This script will set eula=true in your mc server to start it, therefore running this docker container means you agree to the eula thing that minecraft wants.

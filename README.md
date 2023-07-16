# Run manually

Set the forge URL that you want to use in settings.json

docker build . -t minecraft-forge
docker run -it -p 0.0.0.0:25565:25565/tcp -v ${PWD}/server:/server minecraft-forge

# Notes:

This script will set eula=true in your mc server to start it, therefore running this docker container means you agree to the eula thing that minecraft wants.

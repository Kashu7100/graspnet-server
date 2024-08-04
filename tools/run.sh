xhost local:root

docker run -it --rm --gpus all --device=/dev/dri:/dev/dri \
    -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY \
    -v "$PWD":/workspace \
    --net host \
    kashu98/rag3d-graspnet \
    bash -c "ldconfig && apt purge -y hwloc-nox libhwloc-dev libhwloc-plugins && bash command_serve.sh"
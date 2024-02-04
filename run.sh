xhost + local:root

docker run --rm -it \
    --name image_pipeline \
	--env="DISPLAY=:1" \
	--env="QT_X11_NO_MITSHM=1" \
	--volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
    --env="XAUTHORITY=$XAUTH" \
    --volume="$XAUTH:$XAUTH" \
	--privileged \
    --network=host \
    --volume="/dev:/dev" \
    --volume "${PWD}/bags:/colcon_ws/bags/" \
    iss/image_pipeline:humble

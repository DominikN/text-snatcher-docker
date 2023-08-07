# text-snatcher-docker

```bash
docker build -t textsnatcher-test .

xhost +local:docker

docker run \
-e DISPLAY=$DISPLAY \
-e QT_X11_NO_MITSHM=1 \
-e DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus \
-v /tmp/.X11-unix:/tmp/.X11-unix \
-v $HOME/.Xauthority:/root/.Xauthority:rw \
--net=host \
textsnatcher-test

docker run \
-e DISPLAY=$DISPLAY \
-v /tmp/.X11-unix:/tmp/.X11-unix \
--privileged \
--net=host \
textsnatcher-test
```


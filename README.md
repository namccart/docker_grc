Build locally or in a docker stash with:

```
docker build -t grc .
```

Run with:

```
docker run -ti --rm -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix grc
```
docker build -t ldeng_pytorch .
docker run \
  --gpus '"device=5,6"' \
  -d \
  --rm \
  --shm-size=1g \
  --ulimit memlock=-1 \
  --ulimit stack=67108864 \
  --net=host \
  -v /data/ldeng:/workspace \
  --name ldeng_pytorch \
  ldeng_pytorch

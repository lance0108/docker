docker build -t ldeng_pytorch .
docker run \
  --gpus '"device=0,1,2,3,4,5,6,7"' \
  -d \
  --memory=256g \
  --memory-swap=64g \
  --rm \
  --shm-size=8g \
  --ulimit memlock=-1 \
  --ulimit stack=67108864 \
  --net=host \
  --ipc=host \
  -v /data/ldeng:/workspace \
  --name ldeng_pytorch \
  ldeng_pytorch

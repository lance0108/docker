docker build -t ldeng_pytorch .
docker run \
  --gpus '"device=0,1,6,7"' \
  -d \
  --rm \
  --shm-size=1g \
  --ulimit memlock=-1 \
  --ulimit stack=67108864 \
  --net=host \
  -e PYTHONPATH=$PYTHONPATH:/workspace/wip \
  -v /data/ldeng:/workspace \
  --name ldeng_pytorch \
  ldeng_pytorch

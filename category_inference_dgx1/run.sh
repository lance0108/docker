docker build -t ldeng_category_inference .
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
  --name ldeng_category_inference \
  ldeng_category_inference

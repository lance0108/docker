docker build -t ldeng_airflow .
docker run \
  --gpus '"device=0,1,2,3,4,5,6,7"' \
  -d \
  --rm \
  --memory=256g \
  --memory-swap=64g \
  --shm-size=8g \
  --ulimit memlock=-1 \
  --ulimit stack=67108864 \
  --net=host \
  --ipc=host \
  -e PYTHONPATH=$PYTHONPATH:/workspace/wip:/workspace/extract_product_attributes \
  -v /data/ldeng:/workspace \
  --name ldeng_airflow \
  ldeng_airflow

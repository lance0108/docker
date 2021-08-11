docker run \
  -d \
  --cpus=32 \
  --memory=64g \
  --memory-swap=8g \
  --rm \
  --shm-size=1g \
  --ulimit memlock=-1 \
  --ulimit stack=67108864 \
  --net=host \
  --ipc=host \
  -e PYTHONPATH=$PYTHONPATH:/workspace/wip:/workspace/extract_product_attributes \
  -v /data/ldeng/data/neo4j_data:/data \
  -v /home/ldeng/docker/neo4j_dgx1:/conf \
  --name ldeng_neo4j \
  neo4j

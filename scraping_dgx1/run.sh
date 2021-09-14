docker build -t ldeng_scraping .
docker run \
  -d \
  --memory=64g \
  --memory-swap=8g \
  --rm \
  --shm-size=1g \
  --ulimit memlock=-1 \
  --ulimit stack=67108864 \
  --net=host \
  --ipc=host \
  -e PYTHONPATH=$PYTHONPATH:/workspace/wip:/workspace/extract_product_attributes \
  -v /data/ldeng:/workspace \
  --name ldeng_scraping \
  ldeng_scraping

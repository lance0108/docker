# Build the image using the Dockerfile in the current directory.
# You need to replace ldeng_pytorch with your own image name.
docker build -t ldeng_pytorch .
# Start the container
# --gpu: specify the GPUs available to the container
# -d: run container in background
# --memory: specify the memory available to the container
# --memory-swap: memory allowed to swap to disk
# --rm: remove the container once it stops
# --shm-size: shared host memory
# --ulimit memlock: memory that will not be paged out
# --ulimit stack: stack size limit in kb
# --net=host: DGX1 requires container to use host network
# --ipc=host: using host's IPC space for inter-process communication
# -v: use a local directory in the container <folder on dgx1>:<folder inside container>
# --name: the name of the container
# the last arg is the image name
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



docker pull ghcr.io/pranavjain110/ros2_docker/ros2-humble-image-built:latest
docker tag ghcr.io/pranavjain110/ros2_docker/ros2-humble-image-built:latest ros2-humble-image-built

BUILT_IMAGE="humble-image-pc"

echo "Building image from Dockerfile..."
echo "First DOCKER Build"
docker build --no-cache . --build-arg GIT_PAT="$PAT" -t "$BUILT_IMAGE" || { echo "Error: Docker build failed"; exit 1; }


DANGLING_IMAGES=$(docker images -f "dangling=true" -q)
if [[ -n "$DANGLING_IMAGES" ]]; then
	echo "Remove dangling images"
    docker rmi -f $DANGLING_IMAGES || { echo "Error: Failed to remove dangling images"; exit 1; }
fi
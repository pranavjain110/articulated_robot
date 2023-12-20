# branch_name="raspi"
# docker pull ghcr.io/pranavjain110/ros2_docker/ros2-humble-image-built/${branch_name}:latest
# docker tag ghcr.io/pranavjain110/ros2_docker/ros2-humble-image-built/${branch_name}:latest ros2-humble-image-built-raspi

BUILT_IMAGE="humble-image-raspi"
PLATFORM="linux/arm64"

echo "Building image from Dockerfile..."
echo "First DOCKER Build"
docker buildx create --use --driver docker
docker buildx build --platform "$PLATFORM"  --no-cache . -f pi.Dockerfile  --build-arg GIT_PAT="$PAT" -t "$BUILT_IMAGE" --load|| { echo "Error: Docker build failed"; exit 1; }


DANGLING_IMAGES=$(docker images -f "dangling=true" -q)
if [[ -n "$DANGLING_IMAGES" ]]; then
	echo "Remove dangling images"
    docker rmi -f $DANGLING_IMAGES || { echo "Error: Failed to remove dangling images"; exit 1; }
fi
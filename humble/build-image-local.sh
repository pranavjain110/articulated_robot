docker pull ghcr.io/pranavjain110/ros2_docker/ros2-humble-image-built:latest
docker tag ghcr.io/pranavjain110/ros2_docker/ros2-humble-image-built:latest ros2-humble-image-built



# BASE_IMAGE="humble-image-temp"
BUILT_IMAGE="humble-image-pc"

echo "Building image from Dockerfile..."
echo "First DOCKER Build"
docker build --no-cache . --build-arg GIT_PAT="$PAT" -t "$BUILT_IMAGE" || { echo "Error: Docker build failed"; exit 1; }

branch_name="master"

docker tag humble-image-pc ghcr.io/pranavjain110/articulated_robot/humble-image-pc:/${branch_name}latest
docker push ghcr.io/pranavjain110/articulated_robot/humble-image-pc/${branch_name}:latest

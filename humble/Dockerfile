From ros2-humble-image-built as humble-image-pc

RUN apt update

COPY ./workspace/src /root/workspace/src/

ENV ROS_DISTRO=humble


#Source ROS and build workspace
RUN . /opt/ros/$ROS_DISTRO/setup.sh && \
    colcon build

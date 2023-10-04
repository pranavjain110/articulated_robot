From ros2-humble-image-built as humble-image-pc

RUN apt update

COPY ./workspace/src /root/workspace/src/

ENV ROS_DISTRO=humble


# Autocomple for ROS2 and colcon
RUN echo 'eval "$(register-python-argcomplete3 ros2)"' >> /root/.zshrc
RUN echo 'eval "$(register-python-argcomplete3 colcon)"' >> /root/.zshrc

#Source ROS and build workspace
RUN . /opt/ros/$ROS_DISTRO/setup.sh && \
    colcon build

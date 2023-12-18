FROM ros2-humble-image-built-raspi as humble-image-raspi

RUN apt update

COPY ./workspace/src /root/workspace/src/

ENV ROS_DISTRO=humble

#Install Packages
RUN apt install ros-humble-rplidar-ros

#Update ROS dependencies
RUN rosdep update

# Autocomple for ROS2 and colcon
RUN echo 'eval "$(register-python-argcomplete3 ros2)"' >> /root/.zshrc
RUN echo 'eval "$(register-python-argcomplete3 colcon)"' >> /root/.zshrc

# # Create a non-root user
# ARG USERNAME=rospc
# ARG USER_UID=1000
# ARG USER_GID=$USER_UID

# RUN groupadd --gid $USER_GID $USERNAME \
#   && useradd -s /bin/bash --uid $USER_UID --gid $USER_GID -m $USERNAME \
#   && mkdir /home/$USERNAME/.config && chown $USER_UID:$USER_GID /home/$USERNAME/.config

# # # Create the user and set zsh as the default shell
# # RUN groupadd --gid $USER_GID $USERNAME \
# #   && useradd -s /usr/bin/zsh --uid $USER_UID --gid $USER_GID -m $USERNAME \
# #   && mkdir /home/$USERNAME/.config && chown $USER_UID:$USER_GID /home/$USERNAME/.config

# COPY /root/.zshrc /home/$USERNAME/.zshrc

#Source ROS and build workspace
RUN . /opt/ros/$ROS_DISTRO/setup.sh && \
    colcon build

FROM ros2-humble-base-image  as ros2-humble-image-built
RUN colcon build --symlink-install

# add sourcing the catkin workspace to .zshrc
RUN echo 'source ~/workspace/install/setup.zsh' >> ~/.zshrc

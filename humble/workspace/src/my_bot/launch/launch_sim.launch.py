# ROS2 launch file
import os

from ament_index_python.packages import get_package_share_directory

from launch import LaunchDescription
from launch.actions import IncludeLaunchDescription
from launch.launch_description_sources import PythonLaunchDescriptionSource

from launch_ros.actions import Node


def generate_launch_description():
    # Include the robot_state_publisher launch file, provided by my_bot package.
    # Force sim time to true, so we can use the /clock topic.

    package_name = "my_bot"

    rsp = IncludeLaunchDescription(
        PythonLaunchDescriptionSource(
            os.path.join(
                get_package_share_directory(package_name), "launch", "rsp.launch.py"
            )
        ),
        launch_arguments={"use_sim_time": "true"}.items(),
    )

    # Include the gazebo launch file, provided by gazebo_ros package.
    gazebo = IncludeLaunchDescription(
        PythonLaunchDescriptionSource(
            os.path.join(
                get_package_share_directory("gazebo_ros"), "launch", "gazebo.launch.py"
            )
        )
    )

    # Run the spawn_entity.py script (spawner node), provided by gazebo_ros package.
    # Entity name does not matter, I choose my_bot.
    spawn_entity = Node(
        package="gazebo_ros",
        executable="spawn_entity.py",
        arguments=["-entity", "my_bot", "-topic", "/robot_description"],
        output="screen",
    )

    # Launch the robot_state_publisher, gazebo and spawn_entity nodes.
    return LaunchDescription([rsp, gazebo, spawn_entity])

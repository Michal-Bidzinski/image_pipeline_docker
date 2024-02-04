FROM ubuntu:jammy
ARG WORKSPACE


# install packages & setup locales
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    apt-utils \
    bash-completion \
    build-essential \
    ca-certificates \
    curl \
    dirmngr \
    gdb \
    git \
    gnupg2 \
    keyboard-configuration \
    locales \
    lsb-release \
    python3-pip \
    software-properties-common \
    udev \
    wget \
    && rm -rf /var/lib/apt/lists/* \
    && locale-gen en_US en_US.UTF-8; dpkg-reconfigure -f noninteractive locales

ENV LANG="en_US.UTF-8" \
    LANGUAGE="en_US.UTF-8" \
    LC_ALL="en_US.UTF-8"


# install ROS2 & init rosdep
RUN curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key  -o /usr/share/keyrings/ros-archive-keyring.gpg \
    && echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(lsb_release -cs) main" | tee /etc/apt/sources.list.d/ros2.list > /dev/null \
    && apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    ros-humble-ros-base \
    ros-humble-rviz2 \
    ros-humble-cv-bridge \
    python3-autopep8 \
    python3-colcon-common-extensions \
    python3-rosdep \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && /bin/bash -c 'source /opt/ros/humble/setup.bash; rosdep init'
    
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    build-essential \
    libboost-system-dev \
    libboost-thread-dev \
    libboost-program-options-dev \ 
    libboost-test-dev \
    ros-humble-camera-info-manager \ 
    ros-humble-image-geometry

#create workspace
RUN mkdir -p /colcon_ws/src

RUN cd /colcon_ws && git clone -b stereo_humble https://github.com/Michal-Bidzinski/image_pipeline.git

RUN /bin/bash -c '. /opt/ros/humble/setup.bash; cd /colcon_ws; colcon build --cmake-args -DCMAKE_BUILD_TYPE=Release -DCMAKE_EXPORT_COMPILE_COMMANDS=On -Wall -Wextra -Wpedantic'

RUN echo "source /opt/ros/humble/setup.bash" >> ~/.bashrc
RUN echo "source /colcon_ws/install/setup.bash" >> ~/.bashrc

FROM gitpod/workspace-full-vnc
                    
USER gitpod

# Install custom tools, runtime, etc. using apt-get
# For example, the command below would install "bastet" - a command line tetris clone:
#
# RUN sudo apt-get -q update && #     sudo apt-get install -yq bastet && #     sudo rm -rf /var/lib/apt/lists/*
#
# More information: https://www.gitpod.io/docs/config-docker/

RUN sudo apt-get update

RUN sudo apt-get install -y software-properties-common
RUN sudo add-apt-repository ppa:deadsnakes/ppa
RUN sudo DEBIAN_FRONTEND=noninteractive apt-get install -y  python3.8 \
                     python3.8-dev \
                     python3-wxgtk4.0 \
                     libwxgtk3.0-gtk3-dev \
                     libgtk-3-dev \
                     python3-pip \
                     freeglut3-dev\
                     locales \
                     libcanberra-gtk-module \
                     libcanberra-gtk3-module

# RUN sudo DEBIAN_FRONTEND=noninteractive apt-get install git curl libsdl2-mixer-2.0-0 libsdl2-image-2.0-0 libsdl2-2.0-0

ENV LC_ALL C.UTF-8
ENV LANG C.UTF-8 

RUN sudo pip3 install pipenv
RUN sudo locale-gen en_US.UTF-8
RUN sudo locale-gen en_GB.UTF-8

RUN sudo mkdir /project
RUN sudo chown gitpod /project
WORKDIR /project

RUN pipenv --python 3.8

ADD https://extras.wxpython.org/wxPython4/extras/linux/gtk2/ubuntu-18.04/wxPython-4.1.0-cp38-cp38-linux_x86_64.whl ./wxPython-4.1.0-cp38-cp38-linux_x86_64.whl
RUN sudo chmod ugo+r ./wxPython-4.1.0-cp38-cp38-linux_x86_64.whl

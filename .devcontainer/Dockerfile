# Install wxPython deps 
# Nore that we are mounting the X11 socket for display
# So you must allow the container to attach to the display:
#
# xhost local:root
FROM ubuntu:18.04

ARG myuser="auser"
ARG UID=1009
ARG GID=1009

RUN apt update

RUN  DEBIAN_FRONTEND=noninteractive apt install -y python3-pip \
            python3-distutils \
            freeglut3-dev \
            python3-wxgtk4.0 \
            python3-opengl \
            libsdl2-2.0-0

RUN apt -y install software-properties-common
RUN add-apt-repository -y ppa:deadsnakes/ppa 
RUN apt update
RUN  DEBIAN_FRONTEND=noninteractive apt install -y python3.9 python3.9-distutils



ENV LC_ALL C.UTF-8
ENV LANG C.UTF-8 

RUN echo ${myuser}
RUN groupadd -g ${GID} -o ${myuser}
RUN useradd -m -d /home/${myuser} -u ${UID} -g ${GID} -s /bin/bash ${myuser}

RUN pip3 install pipenv
#RUN locale-gen en_US.UTF-8
#RUN locale-gen en_GB.UTF-8

USER ${myuser}

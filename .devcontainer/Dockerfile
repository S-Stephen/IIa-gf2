# Install wxPython deps 
# Nore that we are mounting the X11 socket for display
# So you must allow the container to attach to the display:
#
# xhost local:root
FROM ubuntu:20.04

ARG myuser="auser"
ARG UID=1009
ARG GID=1009

RUN apt update

# The latest wheel for Ubuntu is for Python 3.7
RUN  DEBIAN_FRONTEND=noninteractiv apt install -y python3-pip \
            freeglut3-dev \
            python3-wxgtk4.0 \
            python3-opengl \
            libsdl2-2.0-0


ENV LC_ALL C.UTF-8
ENV LANG C.UTF-8 

RUN echo ${myuser}
RUN groupadd -g ${GID} -o ${myuser}
RUN useradd -m -d /home/${myuser} -u ${UID} -g ${GID} -s /bin/bash ${myuser}


RUN pip3 install pipenv
#RUN locale-gen en_US.UTF-8
#RUN locale-gen en_GB.UTF-8

USER ${myuser}

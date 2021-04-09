# Install wxPython deps 
# Note that we are mounting the X11 socket for display
# So you must allow the container to attach to the display:
#
# xhost local:root
#
FROM alpine:latest

ARG myuser="auser"
ARG UID=1009
ARG GID=1009

RUN echo "@edge http://nl.alpinelinux.org/alpine/v$(cat /etc/alpine-release | cut -d'.' -f1,2)/main" >> /etc/apk/repositories && \
    echo "@testing http://nl.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && \
    echo "@community http://nl.alpinelinux.org/alpine/v$(cat /etc/alpine-release | cut -d'.' -f1,2)/community" >> /etc/apk/repositories
    
RUN apk update

# HELP: py3-wxpython doesn;t sem to provide what we need :-( 
# https://github.com/wxWidgets/Phoenix#prerequisites
# https://stackoverflow.com/questions/62909035/pip-failed-to-compile-wxpython-4-0-7-on-alpine-3-12-0-with-python-3-8-3
RUN  DEBIAN_FRONTEND=noninteractiv apk add py3-pip \
            freeglut-dev \
            py3-wxpython@testing \
            py3-opengl \
            sdl-dev


ENV LC_ALL C.UTF-8
ENV LANG C.UTF-8 

RUN echo $myuser
RUN addgroup -g ${GID} ${myuser}
RUN adduser --disabled-password --home /home/${myuser} --uid ${UID} --ingroup ${myuser} --shell /bin/bash ${myuser}


RUN pip3 install pipenv
#RUN locale-gen en_US.UTF-8
#RUN locale-gen en_GB.UTF-8

USER ${myuser}

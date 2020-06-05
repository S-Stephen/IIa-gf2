FROM ubuntu:20.04

RUN apt update

RUN DEBIAN_FRONTEND="noninteractive" apt-get -y install tzdata

RUN  yes | apt install software-properties-common
RUN add-apt-repository ppa:deadsnakes/ppa
RUN  DEBIAN_FRONTEND="noninteractive" apt install -y  python3.7 \
                     python3.7-dev \
                     python3-wxgtk4.0 \
                     libwxgtk3.0-gtk3-dev \
                     libgtk-3-dev \
                     python3-pip \
                     freeglut3-dev \
                     libcanberra-gtk-module \
                     libcanberra-gtk3-module \
                     locales 

ENV LC_ALL C.UTF-8
ENV LANG C.UTF-8 

RUN pip3 install pipenv
RUN locale-gen en_US.UTF-8
RUN locale-gen en_GB.UTF-8

RUN mkdir /project
WORKDIR /project

RUN pipenv --python 3.7

ADD https://extras.wxpython.org/wxPython4/extras/linux/gtk2/ubuntu-18.04/wxPython-4.0.7.post2-cp37-cp37m-linux_x86_64.whl /tmp/wxPython-4.0.7.post2-cp37-cp37m-linux_x86_64.whl
# ADD https://extras.wxpython.org/wxPython4/extras/linux/gtk2/ubuntu-18.04/wxPython-4.0.7.post2-cp37-cp37m-linux_x86_64.whl ./

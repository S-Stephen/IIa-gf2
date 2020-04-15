[![Gitpod Ready-to-Code](https://img.shields.io/badge/Gitpod-Ready--to--Code-blue?logo=gitpod)](https://gitpod.io/#https://github.com/S-Stephen/IIa-gf2) 

# IIA GF2

A boilerplate directory providing an environment that can be used to develop using [wxPython](https://wxpython.org/) with [OpenGL](https://www.opengl.org/) using [Pipenv](https://github.com/pypa/pipenv) and some [Pipenv docs](https://pipenv-fork.readthedocs.io/en/latest/basics.html). [pycodestyle](http://pycodestyle.pycqa.org/en/latest/intro.html) has been included in replacement of pep8

## Initialization

Following the [installation](#Installation) of the environment, we need to activate the environment after which time we write and run our code:

This is required each time we run via [docker](#via-usage-of-dockerfile), but only the initial time if running from the local [Ubuntu](ubuntu-18.04) install

In the root of this repository, or in the directory we enter on docker run command

```
pipenv shell
pipenv install 
# TO test a few things:
# The next command should produce no output
pycodestyle --first test_wx.py 
python tests/test_wx.py
```

To run the examples, provided the setup has been run:

```
python examples/example_basic.py
```

## Installation

### Ubuntu 18.04

Install the library dependencies and Python into  a **pipenv**; used to run sandboxed python environments.

These commands follow closely those scripted in the Dockerfile

```
sudo apt-get update; 
sudo apt-get install python3-pip; 
pip3 install --user pipenv; 
echo 'export PATH=${HOME}/.local/bin:${PATH}' >> ${HOME}/.bashrc
```

**NB** to upgrade pipenv later:

```
pip install --user --upgrade pipenv
```

Now install Python 3.7 and the dependencies required for wxPython / opengl:

```
sudo apt update
sudo apt install software-properties-common
sudo add-apt-repository ppa:deadsnakes/ppa
sudo apt install -y  python3.7 \
                    python3.7-dev \
                    python3-wxgtk4.0 \
                    libwxgtk3.0-gtk3-dev \
                    libgtk-3-dev \
                    python3-pip \
                    libcanberra-gtk-module \
                    libcanberra-gtk3-module
```


Install the GLUT libraries (required for OpenGL)

```
sudo apt-get install freeglut3-dev

```

Download the wheel used to install wxPython, download this into /tmp

```
wget -O /tmp/wxPython-4.0.7.post2-cp37-cp37m-linux_x86_64.whl https://extras.wxpython.org/wxPython4/extras/linux/gtk2/ubuntu-18.04/wxPython-4.0.7.post2-cp37-cp37m-linux_x86_64.whl 
```

### Via usage of Dockerfile

(It is required that docker be installed on your PC)

**In the root directory of this repository** build the image:

```
docker build . iia_gf2
```

To run the container, effectively log in to the image above, and provide access to your local display:

```
docker run -it  --env="DISPLAY"  --net=host -v `pwd`:/project iia_gf2
```

Once in the container we need to activate the shell and install the package dependencies.  This is required each time we start the container.

```
pipenv shell
pipenv install
```

We can now run our files from the command line of the container, and edit the files locally using the tols on our PC.
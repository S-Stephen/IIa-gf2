[![Gitpod Ready-to-Code](https://img.shields.io/badge/Gitpod-Ready--to--Code-blue?logo=gitpod)](https://gitpod.io/#https://github.com/S-Stephen/IIa-gf2) 

# IIA GF2

A boilerplate directory providing an environment that can be used to develop using [wxPython](https://wxpython.org/) with [OpenGL](https://www.opengl.org/) using [Pipenv](https://github.com/pypa/pipenv) ( [Pipenv docs](https://pipenv-fork.readthedocs.io/en/latest/basics.html) ). [pycodestyle](http://pycodestyle.pycqa.org/en/latest/intro.html) has been included in replacement of pep8

## Initialization

Following the [installation](#Installation) of the environment, before we can start our development work, we need to activate the environment:

Running the following commands are required each time we run via [docker](#via-usage-of-dockerfile), but only the initial time if running from the local [Ubuntu](ubuntu-18.04) install. If you have opened this repository Via gitpod these should automatically have run (so no need to re-run them!).

In the root of this repository, or in the directory we enter on docker run command

```
pipenv shell
pipenv install 
# TO test a few things:
# The next command should produce no output
pycodestyle --first tests/test_wx.py 
python tests/test_wx.py
```

The commands above run a small test to check that the libraries are available. 

The examples, supplied in ./examples can also be run, provided the setup has been run:

```
python examples/example_basics.py
```

In **GitPod** the application can be viewed by following the 'Open Browser' link against port 6080 (via the **Open ports** tab in the lower terminal window).

## Installation

### Ubuntu 20.04

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

Download the wheel used to install wxPython, download this into the applications dependencies directory ./dependencies

```
wget -O ./dependencies/wxPython-4.0.7.post2-cp37-cp37m-linux_x86_64.whl https://extras.wxpython.org/wxPython4/extras/linux/gtk2/ubuntu-18.04/wxPython-4.0.7.post2-cp37-cp37m-linux_x86_64.whl 
```

### Via usage of Dockerfile

(It is required that docker be installed on your PC)

**In the root directory of this repository** build the image:

```
docker build . -t iia_gf2
```

To run the container, effectively log in to the image above, and provide access to your local display:

(provide access to your local display)
```
sudo xhost +local:$(id -un)
```

```
docker run -it  --env="DISPLAY"  --net=host -v `pwd`:/project iia_gf2
```

Once in the container we need to copy the wheel into ./dependencies/ and activate the shell and install the package dependencies.  This is required each time we start the container.

```
cp /tmp/wxPython-4.0.7.post2-cp37-cp37m-linux_x86_64.whl ./dependencies/
pipenv shell
pipenv install
```

We can now run our files from the command line of the container, and edit the files locally using the tools on our PC.

eg
```
python examples/example_basic.py
```

To run code contained in a different directory eg '/myhome/teamX/appname' mount this volume when starting the container:

```
docker run -it  --env="DISPLAY"  --net=host -v `pwd`:/project -v /myhome/teamX/appname:/teamx iia_gf2
```

Then run the setup as before:

```
cp /tmp/wxPython-4.0.7.post2-cp37-cp37m-linux_x86_64.whl ./dependencies/
pipenv shell
pipenv install
```

You should now be able to run the code in directory **/teamx**:

```
python /teamx/somefile.py
```



### Via Gitpod

You will need an account on Github, but you should just be able to follow the link at the top of this README

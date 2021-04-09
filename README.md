
# IIA GF2

A boilerplate directory providing an environment that can be used to develop using [wxPython](https://wxpython.org/) with [OpenGL](https://www.opengl.org/) using [Pipenv](https://github.com/pypa/pipenv) ( [Pipenv docs](https://pipenv-fork.readthedocs.io/en/latest/basics.html) ). [pycodestyle](http://pycodestyle.pycqa.org/en/latest/intro.html) has been included in replacement of pep8

## Run via VSC

### Prerequisites

To run the code in a container within VSC you need to:

* Install the **Remote - Containers** VSC extension
* Allow access to host display by first running 

```
xhost local:root
```

### Configure

Once these prerequisites have been completed:

Either:

* In the bottom left of VSC click on the **Open a Remote Window** tab and choose **Remote Containers: Open Folder in Container..**
* **F1** and select **Remote Containers: Open Folder in Container..**

If you are reopening VSC from the directory you may also have a dialog (bottom right) which asks whether you wish to reopen the folder in a container also.  Following that action is the same as above

Once the container has loaded the terminal should provide access to the python virtual env, to get the liniting working you must select the Python associated to the virtual environment.  To do this **Ctrl+Shift+P** and type/select **Python: Select Interpreter**.

### Run

To run an example:

```
python examples/example_basics.py
```

## Run using the container image

### Prerequisites

```
xhost local:root
```

### Build

Build a container from the **.devcontainer/Dockerfile** setting the user id to your id

```
cd .devcontainer
docker build --build-arg UID=$(id -u) --build-arg GID=$(id -g) -t gf2_38 .
```

### Run

Run the container mounting the current directory something like:

```
docker run -ti --net=host --privileged -v `pwd`/../:/home/auser --env="DISPLAY" gf2_38 /bin/bash
```

Inside the container run an example script:
```
cd ~
pipenv install && pipenv shell
python examples/example_basics.py
```
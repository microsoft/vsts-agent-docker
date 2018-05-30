## Build Images

To Build this Windows based images you can use the build.ps1.  

The Build scripts has to be executed on a Windows mashine with Docker for Windows running.

### build.ps1

Running this script will build all docker images from the dockerfiles in the output folder.  
There are no parameters. Just run it and have a coffee. Maybe 2 or even an extended lunch.  
You can change the proxy settings within the build script so all containers comes preconfigured for using a proxy.

> There is a Parameter `-m 6GB` in the `build .ps1`. This means docker will use 6 GB of RAM to build this images. Pleas make sure your computer has enough RAM!

### dirs.ps1

This script generates a list of all folders with buildable docker files.  

### update.ps1

With this script you can update the content of the output folder. These will compile the templates to the actual dockerfiles

### versions

The file `core\versions` contains a list of windows versions which will set the versions of the base windows images.  
Usualy there is only one entry but you can have multiple separated by a newline.  
Lines starting with a `#` are ignored.

### releases

The file `core\versioned\releases` contains a newline separated list of agent versions of the VSTS Agents.  
Lines starting with a `#` are ignored.

### Folders

#### core\derived

This folder is for Images based on the plain Agent images. There is an example for a minimal setup in `minimal\vs2017`.  
Adding new folders here will also require to edit `update.ps1` and `dirs.ps1`

#### core\setup

Here are the files that are required for the setup of the agent in the docker image.

#### core\output

Contains the complete set of docker files ready to be build.

## Run Images

For running the agents please have a look at the instructions for the linux containers. The Windows containers behave the same way as the linux ones does.
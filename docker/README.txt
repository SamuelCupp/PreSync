To build the image:

  sudo docker build -f presync-base.docker -t presync-base .
  sudo docker build -f presync.docker -t presync .

To rebuild the image from scratch:

  sudo docker pull fedora
  sudo docker build --no-cache -f presync-base.docker -t presync-base .
  sudo docker build --no-cache -f presync.docker -t presync .

To run the image:

  sudo docker run -it --rm presync bash

You will find out-1.txt and out-2.txt which show the results of the
testsuites with presync enabled. In the directory "nout" you will
find out-1.txt and out-2.txt with presync disabled.

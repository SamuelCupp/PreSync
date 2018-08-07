To build the image:

  sudo docker build -f presync.docker -t presync .

To rebuild the image from scratch:

  sudo docker build --no-cache -f presync.docker -t presync .

To run the image:

  sudo docker run -it --rm presync bash

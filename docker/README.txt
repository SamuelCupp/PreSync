To build the image:

  docker build -f presync.docker -t presync .

To rebuild the image from scratch:

  docker build --no-cache -f presync.docker -t presync .

To run the image:

  docker run -it --rm presync bash

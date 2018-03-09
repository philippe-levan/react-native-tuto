FROM debian:9

# install node, npm and some basic tools (git, vim,...)
RUN apt-get update && \
  apt-get install -y \
    git \
    vim \
    curl \
    gnupg && \
  curl -sL https://deb.nodesource.com/setup_6.x | bash - && \
  apt-get install -y \
  	nodejs

# install supervisord
RUN apt-get install -y \
  supervisor

RUN npm install -g create-react-native-app

# copy config files (for supervisord and entrypoint.sh)
COPY docker/rootfs /

# expose the port for each npm start done in the container
EXPOSE 8080

# declare shared volume
VOLUME /code

# go into src dir on docker exec
WORKDIR /code

# chmod a+w on /src and launch supervisord
CMD ["/entrypoint.sh"]

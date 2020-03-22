# Using this as a reference: https://github.com/richstokes/k8s-fah/blob/master/Dockerfile
FROM debian:buster-slim
ARG FAH_VERSION=7.5.1

# just creating the doc dir for fahclient and moving supplied config.xml there as a "sample"
# RUN mkdir -p /usr/share/doc/fahclient/
ADD sample-config.xml /usr/share/doc/fahclient/sample-config.xml

RUN export DEBIAN_FRONTEND=noninteractive && \
  apt-get -y update && \
  apt-get install -yq wget bzip2 && \
  rm -rf /var/lib/apt/lists/* && \
  wget "https://download.foldingathome.org/releases/public/release/fahclient/debian-stable-64bit/v7.5/fahclient_${FAH_VERSION}_amd64.deb" && \
  dpkg -i --force-depends "fahclient_${FAH_VERSION}_amd64.deb" && \
  rm fahclient*.deb && \
  apt-get autoremove -y

WORKDIR /var/lib/fahclient
CMD [ \
  "/usr/bin/FAHClient", \
  "--config", "/etc/fahclient/config.xml", \
  "--config-rotate=false"]

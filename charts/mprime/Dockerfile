FROM debian:buster-slim
ARG MPRIME_VERSION=p95v294b8
RUN export DEBIAN_FRONTEND=noninteractive && \
  apt-get -y update && \
  apt-get install -yq curl && \
  rm -rf /var/lib/apt/lists/* && \
  curl -SL "http://www.mersenne.org/ftp_root/gimps/${MPRIME_VERSION}.linux64.tar.gz" \
  | tar -xz mprime
CMD ["./mprime"]

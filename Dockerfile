ARG node_version=16
ARG occt_version=V7_6_0

FROM "node:$node_version"
ARG occt_version

RUN apt-get update \
  && DEBIAN_FRONTEND=noninteractive apt-get -y install \
  build-essential \
  cmake \
  git \
  tcl-dev \
  tk-dev \
  libfreetype6-dev \
  libgl1-mesa-dev \
  libxmu-dev \
  libxi-dev \
  && rm -rf /var/lib/apt/lists/* \
  && cd / \
  && git clone --depth=50 --branch=$occt_version https://git.dev.opencascade.org/repos/occt.git \
  && cd /occt \
  && mkdir build \
  && cd build \
  && cmake .. \
  && make -j4 install \
  && cd / \
  && rm -rf /occt \
  && apt-get --auto-remove -y purge \
  tcl-dev \
  tk-dev \
  libfreetype6-dev

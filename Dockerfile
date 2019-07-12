ARG node_version=8
ARG occt_version=V7_3_0p3

FROM "node:$node_version"

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
  && git clone https://git.dev.opencascade.org/repos/occt.git \
  && cd /occt \
  && git checkout -b docker $occt_version \
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

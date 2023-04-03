FROM google/cloud-sdk:latest
RUN \
  curl -fsSL https://apt.releases.hashicorp.com/gpg | apt-key add - && \
  curl -fsSL https://packages.cloud.google.com/apt/doc/apt-key.gpg  | apt-key add - && \
  apt install -y software-properties-common && \
  apt-add-repository "deb [arch=amd64] https://apt.kubernetes.io kubernetes-xenial main" && \
  apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main" && \
  export DEBIAN_FRONTEND=noninteractive && \
  apt update  -y --no-install-recommends && \
  apt full-upgrade -y --no-install-recommends && \
  apt install -y --no-install-recommends terraform python3 kubectl && \
  apt clean all && \
  python3 -m pip install --upgrade pip --no-cache-dir  && \
  python3 -m pip install --upgrade ansible  --no-cache-dir

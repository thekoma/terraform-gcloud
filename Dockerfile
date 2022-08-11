FROM google/cloud-sdk:latest
RUN \
  curl -fsSL https://apt.releases.hashicorp.com/gpg | apt-key add - && \
  curl -fsSL https://packages.cloud.google.com/apt/doc/apt-key.gpg  | apt-key add - && \
  apt install -y software-properties-common && \
  apt-add-repository "deb [arch=amd64] https://apt.kubernetes.io kubernetes-xenial main" && \
  apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main" && \
  apt update && \
  apt install -y terraform python3 kubectl && \
  apt clean all && \
  python3 -m pip install --upgrade pip --no-cache-dir  && \
  python3 -m pip install --upgrade ansible  --no-cache-dir

FROM google/cloud-sdk:latest
RUN \
  curl -fsSL https://apt.releases.hashicorp.com/gpg | apt-key add - && \
  apt install -y software-properties-common && \
  apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main" && \
  apt update && \
  apt install -y terraform && \
  apt clean all

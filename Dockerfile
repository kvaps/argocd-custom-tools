FROM argoproj/argocd:v1.7.3

USER root

RUN apt-get update \
 && apt-get install -y git-crypt curl \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN mv /usr/bin/git /usr/bin/git.bin
COPY git /usr/bin/git

RUN curl -L https://github.com/splunk/qbec/releases/download/v0.12.2/qbec-linux-amd64.tar.gz \
      | tar -xvzf - -C /usr/local/bin/ qbec jsonnet-qbec

USER argocd

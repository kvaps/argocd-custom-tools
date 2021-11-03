FROM golang:1.15 as builder

RUN git clone https://github.com/splunk/qbec /usr/local/go/qbec \
 && cd /usr/local/go/qbec \
 && git checkout v0.13.3 \
 && git fetch origin refs/pull/197/head:show-pristine \
 && git merge --ff show-pristine \
 && make os_archive \
 && tar -xvf dist/assets/qbec-linux-amd64.tar.gz -C / \
 && rm -rf dist

FROM argoproj/argocd:v2.1.6

USER root

RUN apt-get update \
 && apt-get install -y git-crypt \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN mv /usr/bin/git /usr/bin/git.bin
COPY git /usr/bin/git
COPY --from=builder qbec jsonnet-qbec /usr/bin/

USER 999

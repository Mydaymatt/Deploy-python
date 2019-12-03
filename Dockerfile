Dockerfile:
FROM python:3.7.2
WORKDIR /root
RUN apk add --update curl \
    && rm -rf /var/cache/apk/* \
    && curl -sL https://storage.googleapis.com/kubernetes-release/release/v1.14.1/bin/linux/amd64/kubectl -o /usr/bin/kubectl \
    && chmod +x /usr/bin/kubectl \
    && mkdir -p .kube
COPY ./admin-vmware-spade.conf .kube/config

ENTRYPOINT ["kubectl"]
CMD ["version"]

FROM ghcr.io/dockhippie/alpine:3.23@sha256:0c390b9f9e8a5a78f0fd573548d2a13e035893de9ed1342ebcb7d33e02a912c2
ENTRYPOINT [""]
ENV PY_COLORS=1
ENV ANSIBLE_FORCE_COLOR=true

# renovate: datasource=pypi depName=ansible-doctor
ENV ANSIBLE_DOCTOR_VERSION=8.4.3

RUN apk update && \
  apk upgrade && \
  apk add --no-cache git python3 python3-dev py3-pip ansible-core build-base libffi-dev openssl-dev cargo && \
  pip3 install --break-system-packages -U ansible-doctor==${ANSIBLE_DOCTOR_VERSION} && \
  apk del build-base libffi-dev openssl-dev cargo && \
  rm -rf /var/cache/apk/* /root/.cache

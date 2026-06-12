FROM ghcr.io/dockhippie/alpine:3.23@sha256:22643f7f07c00c4d953eda05288488b2923f0b23c92b571303b3f5c3a4e6814e
ENTRYPOINT [""]
ENV PY_COLORS=1
ENV ANSIBLE_FORCE_COLOR=true

# renovate: datasource=pypi depName=ansible-doctor
ENV ANSIBLE_DOCTOR_VERSION=8.3.2

RUN apk update && \
  apk upgrade && \
  apk add --no-cache git python3 python3-dev py3-pip ansible-core build-base libffi-dev openssl-dev cargo && \
  pip3 install --break-system-packages -U ansible-doctor==${ANSIBLE_DOCTOR_VERSION} && \
  apk del build-base libffi-dev openssl-dev cargo && \
  rm -rf /var/cache/apk/* /root/.cache

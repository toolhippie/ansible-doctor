FROM ghcr.io/dockhippie/alpine:3.23@sha256:f857559a03da3017be1663750116349e56d315cf0f86e64f508aa0613a9ef313
ENTRYPOINT [""]
ENV PY_COLORS=1
ENV ANSIBLE_FORCE_COLOR=true

# renovate: datasource=pypi depName=ansible-doctor
ENV ANSIBLE_DOCTOR_VERSION=8.1.0

RUN apk update && \
  apk upgrade && \
  apk add --no-cache git python3 python3-dev py3-pip ansible-core build-base libffi-dev openssl-dev cargo && \
  pip3 install --break-system-packages -U ansible-doctor==${ANSIBLE_DOCTOR_VERSION} && \
  apk del build-base libffi-dev openssl-dev cargo && \
  rm -rf /var/cache/apk/* /root/.cache

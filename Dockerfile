FROM ghcr.io/dockhippie/alpine:3.22@sha256:555ec6b7c1727c1fc1be25d4e4cfb0e8bdab9ab1931a20365a873e5e21e4ff18
ENTRYPOINT [""]
ENV PY_COLORS=1
ENV ANSIBLE_FORCE_COLOR=true

# renovate: datasource=pypi depName=ansible-doctor
ENV ANSIBLE_DOCTOR_VERSION=8.0.1

RUN apk update && \
  apk upgrade && \
  apk add --no-cache git python3 python3-dev py3-pip ansible-core build-base libffi-dev openssl-dev cargo && \
  pip3 install --break-system-packages -U ansible-doctor==${ANSIBLE_DOCTOR_VERSION} && \
  apk del build-base libffi-dev openssl-dev cargo && \
  rm -rf /var/cache/apk/* /root/.cache

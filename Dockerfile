FROM ghcr.io/dockhippie/alpine:3.23@sha256:629cd5472f21a622e37a9afabdbd39f489dd22a7fe1e4ced6a0db63589e85dfa
ENTRYPOINT [""]
ENV PY_COLORS=1
ENV ANSIBLE_FORCE_COLOR=true

# renovate: datasource=pypi depName=ansible-doctor
ENV ANSIBLE_DOCTOR_VERSION=8.3.1

RUN apk update && \
  apk upgrade && \
  apk add --no-cache git python3 python3-dev py3-pip ansible-core build-base libffi-dev openssl-dev cargo && \
  pip3 install --break-system-packages -U ansible-doctor==${ANSIBLE_DOCTOR_VERSION} && \
  apk del build-base libffi-dev openssl-dev cargo && \
  rm -rf /var/cache/apk/* /root/.cache

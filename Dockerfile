FROM ghcr.io/dockhippie/alpine:3.18
ENTRYPOINT [""]
ENV PY_COLORS=1
ENV ANSIBLE_FORCE_COLOR=true

# renovate: datasource=pypi depName=ansible-doctor
ENV ANSIBLE_DOCTOR_VERSION=2.1.1

RUN apk update && \
  apk upgrade && \
  apk add python3 python3-dev py3-pip build-base && \
  pip3 install -U ansible-doctor==${ANSIBLE_DOCTOR_VERSION} && \
  apk del build-base && \
  rm -rf /var/cache/apk/* /root/.cache

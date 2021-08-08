FROM webhippie/python:latest

ENTRYPOINT [""]
ENV PY_COLORS=1
ENV ANSIBLE_FORCE_COLOR=true

# renovate: datasource=pypi depName=ansible-doctor
ENV DOCTOR_VERSION=0.3.1

RUN apk update && \
  apk upgrade && \
  pip3 install -U pip ansible-doctor==${DOCTOR_VERSION} && \
  rm -rf /var/cache/apk/*

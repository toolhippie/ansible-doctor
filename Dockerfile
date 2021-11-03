FROM webhippie/alpine:latest
ENTRYPOINT [""]
ENV PY_COLORS=1
ENV ANSIBLE_FORCE_COLOR=true

# renovate: datasource=pypi depName=ansible-doctor
ENV ANSIBLE_DOCTOR_VERSION=1.1.4

RUN apk update && \
  apk upgrade && \
  apk add python3 python3-dev py3-pip && \
  pip3 install -U ansible-doctor==${ANSIBLE_DOCTOR_VERSION} && \
  rm -rf /var/cache/apk/* /root/.cache

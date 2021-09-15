FROM webhippie/python:3.9
ENTRYPOINT [""]
ENV PY_COLORS=1
ENV ANSIBLE_FORCE_COLOR=true

# renovate: datasource=pypi depName=ansible-doctor
ENV ANSIBLE_DOCTOR_VERSION=0.3.3

RUN apk update && \
  apk upgrade && \
  pip3 install -U ansible-doctor==${ANSIBLE_DOCTOR_VERSION} && \
  rm -rf /var/cache/apk/* /root/.cache

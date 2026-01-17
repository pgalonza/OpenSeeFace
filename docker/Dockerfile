# syntax=docker/dockerfile:1
FROM python:3.10-slim

ENV TZ="Europe/Moscow" \
    LANG="en_US.UTF-8"
ARG app_user_name=appuser \
    app_user_id=1000

SHELL ["/bin/sh", "-exc"]

RUN <<EOF
apt-get update
apt-get upgrade
apt-get install -y --no-install-recommends curl unzip
rm -rf /var/lib/apt/lists/*
pip install --upgrade pip
EOF

RUN <<EOF
adduser --disabled-password --system -uid $app_user_id --home /app $app_user_name
usermod -a -G video $app_user_name
EOF

USER $app_user_name

RUN <<EOF
pip install --no-cache-dir onnxruntime opencv-python-headless pillow numpy
EOF

RUN <<EOF
curl -fL https://github.com/emilianavt/OpenSeeFace/archive/refs/heads/master.zip -o /tmp/master.zip
unzip /tmp/master.zip -d /tmp
mv /tmp/OpenSeeFace-master /app/OpenSeeFace
rm /tmp/master.zip
EOF

WORKDIR /app/OpenSeeFace

COPY --chmod=755 ./entrypoint.sh ./entrypoint.sh

CMD ["./entrypoint.sh"]

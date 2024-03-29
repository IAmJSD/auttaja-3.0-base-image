FROM jamiehewland/alpine-pypy:3.6-alpine3.9
LABEL maintainer="kelwing@auttaja.io"
WORKDIR /opt/auttaja
COPY requirements.txt requirements.txt
RUN apk update && \
    apk add --update git zlib jpeg freetype libwebp libffi openssl && \
    apk add --update --virtual .build-deps git build-base linux-headers zlib-dev jpeg-dev freetype-dev libwebp-dev libffi-dev openssl-dev && \
    pip install -r requirements.txt && \
    rm -rf /root/.cache && \
    apk del .build-deps && \
    apk --no-cache add gcc musl-dev && \
    rm requirements.txt

FROM alpine:latest
LABEL Maintainer="Purencool <purencool@gmail.com>" \
      Description="Purencool studio system server default image."

##
# Variables
##
ARG VOLUME_DIRECTORY=/user/src/app


##
# Setup application directory structure and software
##
RUN apk add bash git && \
    mkdir -p ${VOLUME_DIRECTORY}

COPY ./bash/* ${VOLUME_DIRECTORY}/
RUN find ${VOLUME_DIRECTORY} -type f -iname "*" -exec chmod +x {} \; && \
    mkdir -p ${VOLUME_DIRECTORY}/mntdir && \
    touch ${VOLUME_DIRECTORY}/mntdir/README && \
    echo "Welcome to your volume" > ${VOLUME_DIRECTORY}/mntdir/README


##
# Install server software
##
WORKDIR ${VOLUME_DIRECTORY}

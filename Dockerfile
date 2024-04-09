FROM ubuntu:22.04

ARG UID
ARG GID=${UID}
ARG USER
ARG GROUP=${USER}
ARG PASSWORD=user

RUN apt-get update && \
    apt-get install -y \
    sudo

RUN groupadd -g ${GID} ${GROUP} && \
    useradd -m -s /bin/bash -u ${UID} -g ${GID} -G sudo ${USER} && \
    echo $USER:$PASSWORD | chpasswd && \
    echo "$USER   ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

USER ${USER}

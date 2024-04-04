FROM ubuntu:22.04

ARG UID
ARG GID
ARG USER_NAME
ARG GROUP_NAME

RUN echo "UID: ${UID}" 

RUN groupadd -g ${GID} ${GROUP_NAME} \
    && useradd -m -s /bin/bash -u ${UID} -g ${GID} ${USER_NAME}

USER ${USER_NAME}

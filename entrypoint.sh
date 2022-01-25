#!/bin/sh

adduser -h /home/${SSH_USER} -s /bin/sh -D ${SSH_USER} -G wheel && \
    echo -n "${SSH_USER}:${SSH_PASS}" | chpasswd || exit 1

ssh-keygen -A
exec /usr/sbin/sshd -D -e "$@"

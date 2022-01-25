FROM alpine

ENV SSH_USER="user"
ENV SSH_PASS="pass"
ENV SSH_ROOT_PASS="pass"

WORKDIR /app
COPY entrypoint.sh /app/entrypoint.sh
RUN apk add --upgrade --no-cache openssh sudo && \
    echo 'PasswordAuthentication yes' >> /etc/ssh/sshd_config && \
    echo '%wheel ALL=(ALL) NOPASSWD: ALL' > /etc/sudoers.d/wheel && \
    echo -n "root:${SSH_ROOT_PASS}" | chpasswd

ENTRYPOINT [ "/app/entrypoint.sh" ]

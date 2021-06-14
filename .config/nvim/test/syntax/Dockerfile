##########################################
# 863 MB
FROM ubuntu:20.10 AS base

RUN apt-get update && apt-get install -y \
  openssh-server sudo locales locales-all libreadline-dev
  # python3 python
  # RUN apt-get install -y curl git zsh bc python3 python unzip

# set up locales
ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8
# set up ssh
RUN mkdir /var/run/sshd
RUN echo 'root:screencast' | chpasswd
RUN sed -i '/PermitRootLogin /d' /etc/ssh/sshd_config
RUN echo 'PermitRootLogin yes' >> /etc/ssh/sshd_config
# RUN sed -i '/^LogLevel /d' /etc/ssh/sshd_config
# RUN echo 'LogLevel DEBUG3' >> /etc/ssh/sshd_config
# SSH login fix. Otherwise user is kicked off after login
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

# unminimize packed distribution
RUN yes | unminimize

RUN apt-get autoremove && apt-get clean

# ------- Ansible -------
FROM base AS ansible
RUN apt-get install -y ansible

# ------- launcher -------
FROM ansible AS launcher
EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]

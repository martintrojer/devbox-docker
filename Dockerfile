FROM ubuntu:trusty

RUN apt-get -y update
RUN apt-get -y install emacs24-nox emacs24-el emacs24-common-non-dfsg
RUN apt-get -y install git tmux curl silversearcher-ag tree htop unzip wget
RUN apt-get -y install openssh-server

# wemux
RUN git clone https://github.com/zolrath/wemux.git /usr/local/share/wemux
RUN ln -s /usr/local/share/wemux/wemux /usr/local/bin/wemux
COPY wemux.conf /usr/local/etc/wemux.conf

# user
RUN adduser --disabled-password --gecos '' martin
WORKDIR /home/martin
USER martin
RUN mkdir .ssh
COPY authorized_keys /home/martin/authorized_keys
RUN mv authorized_keys .ssh

RUN git clone https://github.com/martintrojer/dotfiles.git
RUN dotfiles/.bootstrap.sh -f

USER root
RUN chown -R martin .ssh
RUN chmod -R 0700 .ssh

CMD service ssh start

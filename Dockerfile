FROM phusion/baseimage:0.9.11
# c.f. https://github.com/phusion/baseimage-docker
MAINTAINER Akimichi Tatsukawa <akimichi.tatsukawa@gmail.com>
ENV REFRESHED_AT 2016-1-15(Fri)
## Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

# ENV HOME /root
RUN /etc/my_init.d/00_regen_ssh_host_keys.sh

RUN sed -i~ -e 's;http://archive.ubuntu.com/ubuntu;http://ftp.jaist.ac.jp/pub/Linux/ubuntu;' /etc/apt/sources.list
RUN apt-get -yqq update

## Japanese Environment
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y language-pack-ja
ENV LANG ja_JP.UTF-8
RUN update-locale LANG=ja_JP.UTF-8
RUN (mv /etc/localtime /etc/localtime.org && ln -s /usr/share/zoneinfo/Asia/Tokyo /etc/localtime)

## Development Environment
ENV EDITOR vim
RUN update-alternatives --set editor /usr/bin/vim.basic
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y git wget curl unzip build-essential python-dev rake

#################
# install haskell
#################
RUN mkdir /workspace
WORKDIR /workspace
RUN export DEBIAN_FRONTEND=noninteractive && \
  apt-get update && \
  apt-get dist-upgrade -qqy && \
  apt-get install -qqy --no-install-recommends software-properties-common && \
  add-apt-repository -y ppa:hvr/ghc && \
  apt-get update && \
  apt-get install -qqy cabal-install-1.22 ghc-7.10.2 happy-1.19.5 alex-3.1.4 && \
  apt-get autoremove -qqy && \
  apt-get clean && apt-get autoclean && \
  rm -rf /usr/share/man/?? && rm -rf /usr/share/man/??_*

ENV PATH="${HOME}/.cabal/bin:/opt/cabal/1.22/bin:/opt/ghc/7.10.2/bin:${PATH}"

RUN wget https://www.stackage.org/lts/cabal.config

# install stackage
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 575159689BEFB442
RUN echo 'deb http://download.fpcomplete.com/ubuntu trusty main' | tee /etc/apt/sources.list.d/fpco.list
RUN apt-get update && apt-get install stack -y
COPY src /workspace/src/
# COPY Setup.hs LICENSE /workspace/haskell/
COPY haskell-labo.cabal Setup.hs LICENSE /workspace/
RUN stack init
RUN stack setup
# RUN stack build

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

VOLUME /workspace

CMD ["bash"]

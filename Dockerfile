FROM fedora:latest

MAINTAINER "Daryl Metzler"

ADD . /opt/accretion

RUN dnf -y update \
	&& dnf -y install ruby rubygem-bundler \
	&& cd /opt/accretion && bundle install

EXPOSE 9292

FROM fedora:latest

MAINTAINER "Daryl Metzler"

ADD . /opt/accretion

RUN dnf -y update \
	&& dnf -y install ruby ruby-devel redhat-rpm-config \
	&& dnf -y groupinstall "Development Tools" \
	&& gem install bundler \
	&& cd /opt/accretion && bundle install

EXPOSE 9292

#!/bin/bash -ex

rackup config.ru -p ${ACCRETION_PORT:-9292}

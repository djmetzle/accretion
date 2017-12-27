#!/bin/bash -ex

rackup $(dirname "${BASH_SOURCE[0]}")/config.ru -p ${ACCRETION_PORT:-9292} --host 0.0.0.0

#!/bin/sh

set -x

MIX_ENV=$1
OTP_VERSION=$2
ELIXIR_VERSION=$3

sudo docker run --privileged --network=host --rm -v `pwd`:/work quay.io/pypa/manylinux2014_x86_64:latest \
    sh -c "chmod a+x /work/do-build-manylinux2014.sh && /work/do-build-manylinux2014.sh ${MIX_ENV} ${OTP_VERSION} ${ELIXIR_VERSION}"

if [ -d "`pwd`/_build" ]; then
  sudo chmod -R a+wr `pwd`/_build ;
fi

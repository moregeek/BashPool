#!/usr/bin/env bash

: ${BASEDIR:=$(cd $(dirname $0)/../ && pwd)}

test -d ${BASEDIR/tmp} \
  && rm -rf ${BASEDIR}/tmp

mkdir -p ${BASEDIR}/tmp/shunit2 \
  && curl -Ls "https://shunit2.googlecode.com/files/shunit2-2.1.6.tgz" | tar zx -C tmp/shunit2 --strip-components=1

suite () {
  for test_file in $(\ls tests/*.test); do
    source ${test_file}
    test_methods="$(_shunit_extractTestFunctions ${test_file})"
    for test_method in ${test_methods}; do
      suite_addTest ${test_method}
    done
  done
}

setUp () {
  cd ${BASEDIR}/tests
}

source tmp/shunit2/src/shunit2

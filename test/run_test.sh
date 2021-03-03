#!/bin/bash

which docker
if [ $? -eq 0 ]
then
    docker --version | grep "Docker version"
    if [ $? -eq 0 ]
    then
        echo "Docker exists."
        # Absolute path to this script. /home/user/bin/foo.sh
        SCRIPT=$(readlink -f $0)
        # Absolute path this script is in. /home/user/bin
        SCRIPTPATH=`dirname $SCRIPT`
        cd ${SCRIPTPATH}
        # Duild docker image
        echo "============================================================="
        echo "Building docker image for test env."
        echo "============================================================="
        docker build -t globalgraphics_test_env ./docker/
        echo "============================================================="
        echo "Running functional test."
        echo "============================================================="
        docker run   -v ${SCRIPTPATH}/../:/globalgraphics_test/ -w /globalgraphics_test/test -it globalgraphics_test_env python3 -m behave  -f=pretty -o reports/test.log --junit --junit-directory=reports
        echo "Generate html report."
        docker run   -v ${SCRIPTPATH}/../:/globalgraphics_test/ -w /globalgraphics_test/test -it globalgraphics_test_env junit2html ./reports/TESTS-features.test.xml ./reports/test_result.html
        echo "============================================================="
        echo "Running performence test memmemory_profiler."
        echo "============================================================="
        docker run   -v ${SCRIPTPATH}/../:/globalgraphics_test/ -w /globalgraphics_test/test -it globalgraphics_test_env python3 ./perf_test/perf_test.py > ./reports/performence-test-result.txt
        echo "============================================================="
        echo "Running performence test pyinstrument."
        echo "============================================================="
        docker run   -v ${SCRIPTPATH}/../:/globalgraphics_test/ -w /globalgraphics_test/test -it globalgraphics_test_env python3 -m pyinstrument -r html -o reports/time_test_impl1_log.html ./perf_test/time_test_impl1.py
        docker run   -v ${SCRIPTPATH}/../:/globalgraphics_test/ -w /globalgraphics_test/test -it globalgraphics_test_env python3 -m pyinstrument -r html -o reports/time_test_impl2_log.html ./perf_test/time_test_impl2.py
        docker run   -v ${SCRIPTPATH}/../:/globalgraphics_test/ -w /globalgraphics_test/test -it globalgraphics_test_env python3 -m pyinstrument -r html -o reports/time_test_impl3_log.html ./perf_test/time_test_impl3.py

        echo "Test reports at ${SCRIPTPATH}/reports"
    else
        echo "Install docker.. we need docker to run this."
    fi
else
    echo "Install docker.. we need docker to run this." >&2
fi
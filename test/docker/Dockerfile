FROM ubuntu:20.04
MAINTAINER Jay Prakash Dakhinray <dakhinray@gmail.com>


RUN apt-get update
RUN apt-get install -y \
	python3.8 \
	git \
	python3-pip
RUN pip3 install \
	 behave \
	 PyHamcrest \
	 junit2html \
	 memory_profiler \
	 pyinstrument

FROM ubuntu:trusty

RUN apt-get update
RUN apt-get install -y --no-install-recommends \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common 
RUN  curl -fsSL https://apt.dockerproject.org/gpg | sudo apt-key add - 
RUN add-apt-repository \
       "deb https://apt.dockerproject.org/repo/ \
       ubuntu-$(lsb_release -cs) \
       main"
RUN apt-get update

RUN apt-get -y install docker-engine
ADD start.sh .
ENTRYPOINT ./start.sh
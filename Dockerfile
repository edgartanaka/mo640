FROM ubuntu:16.04

RUN apt-get update
RUN apt-get install -y software-properties-common vim
RUN add-apt-repository ppa:jonathonf/python-3.6
RUN apt-get update

RUN apt-get install -y build-essential python3.6 python3.6-dev python3-pip python3.6-venv
RUN apt-get install -y git

# update pip
RUN python3.6 -m pip install pip --upgrade
RUN python3.6 -m pip install wheel

RUN alias python=python3.6
RUN git clone https://github.com/alceubissoto/mo640.git
WORKDIR /mo640

# install python libs
RUN pip install numpy
RUN pip install scikit-bio
RUN pip install -r requirements.txt
RUN apt-get install -y graphviz libgraphviz-dev pkg-config python3-tk
RUN pip install git+git://github.com/pygraphviz/pygraphviz.git

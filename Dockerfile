FROM ubuntu:latest

RUN apt-get update && apt-get install -y \
    sudo \
    wget \
    vim \
    git

WORKDIR /opt

RUN wget https://repo.anaconda.com/archive/Anaconda3-2020.07-Linux-x86_64.sh && \
    sh Anaconda3-2020.07-Linux-x86_64.sh -b -p /opt/anaconda3 && \
    rm -f Anaconda3-2020.07-Linux-x86_64.sh

ENV PATH /opt/anaconda3/bin:$PATH

WORKDIR /code

COPY requirements.txt /code/

RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py && \
    python get-pip.py

RUN pip install -r requirements.txt



CMD ["jupyter", "lab", "--ip=0.0.0.0", "--allow-root"]

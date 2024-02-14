FROM ubuntu:18.04

RUN apt update \
    && apt install -y python3-pip htop python3 wget \
    && pip3 install numpy pandas

RUN wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh \
    && mkdir root/.conda \ 
    && sh Miniconda3-latest-Linux-x86_64.sh -b \
    && rm Miniconda3-latest-Linux-x86_64.sh

ENV PATH /root/miniconda3/bin:$PATH

RUN conda create -y -n ml python=3.7

COPY . src/

RUN /bin/bash -c "cd src \
    && source activate ml \
    && pip3 install -r requirements.txt"
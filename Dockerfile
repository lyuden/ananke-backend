FROM ubuntu:16.04

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y \
    python3 \
    python3-setuptools \
    python3-pip \
    python3-venv

RUN mkdir /ananke/
RUN python3.5 -m venv /ananke/venv/

COPY requirements.txt /ananke/
RUN /ananke/venv/bin/pip install --upgrade pip
RUN /ananke/venv/bin/pip install -r /ananke/requirements.txt

COPY server.py /ananke/

RUN mkdir /ananke/tests/
COPY /tests/   /ananke/tests/

WORKDIR /ananke/

CMD ["./venv/bin/python","server.py"]





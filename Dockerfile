FROM ubuntu:22.04
WORKDIR /app/
ENV PYTHONUNBUFFERED 1
ENV TZ America/Los_Angeles
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get clean all && \
    apt-get install -y \
    locales \
    gcc \
    python-setuptools \
    python3 \ 
    python3-pip \
    python3-dev \
    python3-venv \
    hdf5-tools \ 
    libmkl-core libmkl-def libmkl-locale libmkl-vml-def \
    libmkl-rt libomp-14-doc libtbb2-doc \
    libopenblas-base \
    git \
    vim \ 
    curl
#    sassc \
#    lynx \
#    libpq-dev \
#    postgresql

RUN git clone https://github.com/smatsmats/comorbidityPaper.git

RUN locale-gen en_US.UTF-8
# locale.getdefaultlocale() searches in this order
ENV LANGUAGE en_US.UTF-8
ENV LC_ALL en_US.UTF-8
ENV LC_CTYPE en_US.UTF-8
ENV LANG en_US.UTF-8

## /config holds configmap'd config files and templates
RUN mkdir /config
ADD requirements.txt /app/
ADD scripts /scripts
#ADD code /app/code
#ADD param_files /app/param_files
#ADD out /app/out
#ADD config /app/config

RUN pip install -U pip setuptools wheel && \
    pip install -r requirements.txt


# final configuration
#ENV FLASK_APP=hello
#EXPOSE 8000
#CMD ["flask", "run", "--host", "0.0.0.0", "--port", "8000"]
CMD ["/bin/python3", "/app/code/1_create_param_file.py"]


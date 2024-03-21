#!/bin/bash

#export PATH=$PATH:/usr/bin/

RUN git clone --branch task/containerize https://github.com/smatsmats/comorbidityPaper.git

cd /app/comorbidityPaper/code
/usr/bin/python3 1_create_param_file.py
/usr/bin/python3 2_simulate.py


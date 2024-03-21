#!/bin/bash

#export PATH=$PATH:/usr/bin/

cd /app/comorbidityPaper/code
/usr/bin/python3 1_create_param_file.py
/usr/bin/python3 2_simulate.py


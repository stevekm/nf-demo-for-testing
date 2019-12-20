#!/bin/bash

# LSF transfers most environment variables between submission and execution hosts. https://www.ibm.com/support/knowledgecenter/en/SSWRJV_10.1.0/lsf_config_ref/lsf_envars_job_exec.html
bsub -oo lsf.log ./run.sh
# -sla cmo \
# -W 100 \

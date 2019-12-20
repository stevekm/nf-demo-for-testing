#!/bin/bash
set -x

export PATH=/juno/work/ci/kellys5/projects/tempo-nextflow-logger-dev/ridgeback_dev/ridgeback/conda/bin:${PATH}

# https://www.nextflow.io/docs/latest/config.html?highlight=nxf_work#environment-variables
export NXF_ANSI_LOG=false
export NXF_ANSI_SUMMARY=false
export NXF_HOME=$PWD/.nextflow
export NXF_WORK=$PWD/work
export NXF_TEMP=$NXF_WORK/tmp
export NXF_PID_FILE=.nextflow.pid
# export NXF_EXECUTOR=lsf

nextflow run main.nf -params-file params1.json

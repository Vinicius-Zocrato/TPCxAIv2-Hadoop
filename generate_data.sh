#!/bin/bash
# Stop if any command fails
set -e

. setenv.sh

TPCxAI_CONFIG_FILE_PATH=${TPCxAI_VALIDATION_CONFIG_FILE_PATH}

# Only generate data for use case 1
./bin/tpcxai.sh --phase {CLEAN,DATA_GENERATION} -sf ${TPCxAI_SCALE_FACTOR}  --streams ${TPCxAI_SERVING_THROUGHPUT_STREAMS}  -c ${TPCxAI_CONFIG_FILE_PATH} ${VFLAG} -uc 1

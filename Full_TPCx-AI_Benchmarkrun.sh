#!/bin/bash

#
# Copyright (C) 2022 Transaction Processing Performance Council (TPC) and/or its contributors.
# This file is part of a software package distributed by the TPC
# The contents of this file have been developed by the TPC, and/or have been licensed to the TPC under one or more contributor
# license agreements.
# This file is subject to the terms and conditions outlined in the End-User
# License Agreement (EULA) which can be found in this distribution (EULA.txt) and is available at the following URL:
# http://www.tpc.org/TPC_Documents_Current_Versions/txt/EULA.txt
# Unless required by applicable law or agreed to in writing, this software is distributed on an "AS IS" BASIS, WITHOUT
# WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied, and the user bears the entire risk as to quality
# and performance as well as the entire cost of service or repair in case of defect. See the EULA for more details.
#



# Stop if any command fails
set -e

# Find benchmark kit base directory
#export TPCx_AI_HOME_DIR=$(cd `dirname -- $0` && pwd);
cd "$(dirname ${BASH_SOURCE[0]})"
export TPCx_AI_HOME_DIR="$PWD"
cd "$OLDPWD"

if [ "$PWD" != "${TPCx_AI_HOME_DIR}" ]; then
	echo "FAILED: Your current path is not the kit's home directory. Please run this script from ${TPCx_AI_HOME_DIR}."
	exit 1;
fi

#
# Run validation script first
${TPCx_AI_HOME_DIR}/TPCx-AI_Validation.sh

# Benchmark run
${TPCx_AI_HOME_DIR}/TPCx-AI_Benchmarkrun.sh


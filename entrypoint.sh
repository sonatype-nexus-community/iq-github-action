#!/bin/sh -l

# Copyright (c) 2019-present Sonatype, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

DEBUG_ENABLED=0
if [[ "true" == "${7}" ]]; then
    DEBUG_ENABLED=1
fi

NEXUS_CONTAINER_SCANNING_MOUNT_PATH=`mktemp -d -p $GITHUB_WORKSPACE`

debug() {
    # $1 is message
    if [[ $DEBUG_ENABLED == 1 ]]; then
        echo $1
    fi
}

cleanup() {
    # Clean up workspace
    rm -rf com.sonatype.insight.scan.outDir_IS_UNDEFINED
    rm -rf $NEXUS_CONTAINER_SCANNING_MOUNT_PATH
}
trap cleanup EXIT

debug "Preparing the Sonatype Lifecycle GitHub Action..."

EVALUATE_OPTS="-s $1 -a $2:$3 -i $4 -t $5"
TARGETS="$6"

# If Debug Enabled, pass the flag to IQ CLI
if [[ $DEBUG_ENABLED == 1 ]]; then
    EVALUATE_OPTS="${EVALUATE_OPTS} -X"
fi

# Handle optional Proxy arguments
if [[ ! -z "$8" ]]; then
    EVALUATE_OPTS="${EVALUATE_OPTS} -p ${8}"
fi
if [ ! -z "$9" ]; then
    EVALUATE_OPTS="${EVALUATE_OPTS} -U ${9}"
fi

# Handle $10 for -r flag
if [[ "true" == "${10}" ]]; then
    EVALUATE_OPTS="${EVALUATE_OPTS} -r $GITHUB_WORKSPACE/sonatype-lifecycle-policy-eval.json"
fi

debug "NEXUS_CONTAINER_SCANNING_MOUNT_PATH will be: ${NEXUS_CONTAINER_SCANNING_MOUNT_PATH}"
debug "EVALUATE_OPTS will be: ${EVALUATE_OPTS}"
debug "Target will be: ${TARGETS}"

/sonatype/evaluate $EVALUATE_OPTS $TARGETS

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

cleanup() {
# Clean up workspace
rm -rf com.sonatype.insight.scan.outDir_IS_UNDEFINED
}
trap cleanup EXIT

/sonatype/evaluate -s $1 -a $2:$3 -i $4 -t $5 $GITHUB_WORKSPACE/$6

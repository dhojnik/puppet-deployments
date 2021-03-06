#!/bin/bash -ex

# Copyright 2015 Red Hat, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License"); you may
# not use this file except in compliance with the License. You may obtain
# a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
# WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
# License for the specific language governing permissions and limitations
# under the License.

rm -f /tmp/tempest/tempest.log
sudo rm -f /tmp/tempest/cirros-0.3.4-x86_64-disk.img
wget http://download.cirros-cloud.net/0.3.4/cirros-0.3.4-x86_64-disk.img -P /tmp/tempest

set +e
# Select what to test:
# Smoke suite
TESTS="smoke"

# Horizon
TESTS="${TESTS} dashbboard"

cd /tmp/tempest; tox -eall -- --concurrency=4 $TESTS

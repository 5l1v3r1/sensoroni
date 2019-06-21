#!/bin/bash

# Copyright 2019 Jason Ertel (jertel). All rights reserved.
#
# This program is distributed under the terms of version 2 of the
# GNU General Public License.  See LICENSE for further details.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

version=${1:-dev}

buildTime=`date +%Y-%m-%dT%H:%M:%S.%N%:z`

go get ./...
go build -ldflags '-extldflags "-static"' -tags netgo cmd/sensoroni.go

echo "{\"label\":\"$version\",\"buildTime\":\"$buildTime\"}" > version.json

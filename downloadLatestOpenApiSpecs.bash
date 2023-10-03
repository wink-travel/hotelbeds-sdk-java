#!/bin/bash

#
# Copyright (c) 2023. wink.travel. All rights Reserved.
# Responsibility:
# Downloads all Open API spec files from
#

retrieveOpenApiSpecFunction() {
  url=$1
  location=$2

  echo "Copying the contents of the URL to $location"

  curl ${url} > $location

  echo "Download of $url complete"
}

echo "Download latest deployed Open API specs..."
echo "Grabbing Hotelbeds spec..."
url="https://bitbucket.org/ApiPortalHotelbeds/apitude-openapi/raw/master/OpenAPI-Hotel-BookingAPI-3.0.yaml"
outputLocation="./src/main/resources/openapi-spec.yaml"

retrieveOpenApiSpecFunction $url $outputLocation

STATUS=$?
if [ $STATUS -ne 0 ]; then
  echo "Something went wrong on line: ${BASH_LINENO[*]}"
  exit 1
fi

echo "Download SUCCESS. Exit code: $STATUS"

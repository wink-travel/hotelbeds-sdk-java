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

echo "Grabbing Hotelbeds Booking spec..."
bookingUrl="https://bitbucket.org/ApiPortalHotelbeds/apitude-openapi/raw/master/OpenAPI-Hotel-BookingAPI-3.0.yaml"
bookingSpecLocation="./booking/src/main/resources/openapi-spec.yaml"

retrieveOpenApiSpecFunction $bookingUrl $bookingSpecLocation

echo "Grabbing Hotelbeds Cache spec..."
contentUrl="https://bitbucket.org/ApiPortalHotelbeds/apitude-openapi/raw/master/OpenAPI-Hotel-CacheAPI-3.0.yaml"
contentSpecLocation="./cache/src/main/resources/openapi-spec.yaml"

retrieveOpenApiSpecFunction $contentUrl $contentSpecLocation

echo "Grabbing Hotelbeds Content spec..."
contentUrl="https://bitbucket.org/ApiPortalHotelbeds/apitude-openapi/raw/master/OpenAPI-Hotel-ContentAPI-3.0.yaml"
contentSpecLocation="./content/src/main/resources/openapi-spec.yaml"

retrieveOpenApiSpecFunction $contentUrl $contentSpecLocation

STATUS=$?
if [ $STATUS -ne 0 ]; then
  echo "Something went wrong on line: ${BASH_LINENO[*]}"
  exit 1
fi

echo "Download SUCCESS. Exit code: $STATUS"

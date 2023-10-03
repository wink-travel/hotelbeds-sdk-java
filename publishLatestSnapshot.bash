#!/bin/bash

#
# Copyright (c) 2023. wink.travel. All rights Reserved.
#

echo "Publishing hotelbeds-sdk-java SNAPSHOT..."

./downloadLatestOpenApiSpecs.bash

git commit -a -m ":bookmark: build: Updated Open API files"

echo "Pushing develop to origin"
git push origin develop:refs/heads/develop

# Deprecated - Moved this to build server
#echo "Pushing snapshot artifacts to Sonatype..."
#mvn deploy -Psonatype-oss-release

echo "Publishing hotelbeds-sdk-java SNAPSHOT SUCCESS"

#!/bin/bash

SCRIPT=$0
BUILD_MODE=$1

# DEVELOPMENT..
if [ "$BUILD_MODE" = "dev" ]; then
  echo "Building [DEVELOPMENT] environment"
  source ./script/dev-build.sh

elif [ "$BUILD_MODE" = "dev-release" ]; then
  echo "Building [DEVELOPMENT RELEASE] environment"
  source ./script/dev-release-build.sh

# STAGING..
elif [ "$BUILD_MODE" = "staging" ]; then
  echo "Building [STAGING] environment"
  source ./script/staging-build.sh

# PRODUCTION..
elif [ "$BUILD_MODE" = "prod" ]; then
  echo "Building [PRODUCTION] environment"
  source ./script/prod-build.sh

# ERROR..
else
  echo "use: $SCRIPT [dev|staging|prod]"
  echo "example: $SCRIPT dev"
  exit 1
fi
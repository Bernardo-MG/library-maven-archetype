#!/bin/bash
# This script deploys the project artifact.
#
# Make sure you have the deployment configuration ready before using it.
#
# It is triggered only commits to the master or develop branches, ignoring pulls.
#
# Also, it will only deploy if the DEPLOY environment variable is set to 'true'.
#
# The following environmental variables are used:
# - PULL_REQUEST: boolean, indicates if this is a pull request, should be false for deployment
# - DEPLOY: boolean, control flag for deployment, should be true to deploy
# - VERSION_TYPE: string, the type of version of the code. One of 'release', 'develop' or 'other'.

if [ "$PULL_REQUEST" == "false" ] && [ "$DEPLOY" == "true" ] && [ "$VERSION_TYPE" != "other" ]; then

   echo "Deploying Java artifact to repository"

   mvn deploy -P deployment --settings ~/settings.xml
   
else

   echo "Java artifact won't be deployed to repository"

fi

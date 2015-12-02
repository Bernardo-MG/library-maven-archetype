#!/bin/bash
# This script deploys the Maven site.
#
# Make sure you have the deployment configuration ready before using it.
#
# It is triggered only commits to the master or develop branches, ignoring pulls.
#
# Also, it will only deploy if the DEPLOY_DOCS environment variable is set to 'true'.
#
# The following environmental variables are used:
# - PULL_REQUEST: boolean, indicates if this is a pull request, should be false for deployment
# - DEPLOY_DOCS: boolean, control flag for deployment, should be true to deploy
# - VERSION_TYPE: string, the type of version of the code. One of 'release', 'develop' or 'other'.

if [ "$PULL_REQUEST" == "false" ] && [ "$DEPLOY_DOCS" == "true" ] && [ "$VERSION_TYPE" != "other" ]; then

   echo "Deploying Maven site"

   mvn site site:deploy -P deployment --settings ~/settings.xml > site_output.txt
	  
   head -50 site_output.txt
   echo " "
   echo "(...)"
   echo " "
   tail -50 site_output.txt

else

   echo "Maven site won't be deployed"

fi

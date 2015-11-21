#!/bin/bash
#
# This script creates the Maven settings file for the CI process, which will be stored on the
# ~/settings.xml path.
#
# The file will include the connection settings, loaded from the servers environmental variables.
#
# It will also set the profile to be used, depending on the environmental variables set.
#
# For security reasons the data generated during this script should not be shared. Never print it 
# on the console or let it be accessed in any way.
#
# The following environmental variables are required by the script:
# - DEPLOY_USER: string, user for the releases repo
# - DEPLOY_PASSWORD: string, password for the releases repo
# - DEPLOY_DEVELOP_USER: string, user for the development repo
# - DEPLOY_DEVELOP_PASSWORD: string, password for the development repo
# - DEPLOY_DOCS_USER: string, user for the releases documentation site repo
# - DEPLOY_DOCS_PASSWORD: string, password for the releases documentation site repo
# - DEPLOY_DOCS_DEVELOP_USER: string, user for the development documentation site repo
# - DEPLOY_DOCS_DEVELOP_PASSWORD: string, password for the development documentation site repo
# - SCM_BRANCH: string, the CMS branch from which the code has been taken

{
   echo "<settings>";
   
   # ----------------
   # Servers settings
   # ----------------
   echo "<servers>";
   
   # Releases artifacts server
   echo "<server>";
      echo "<id>releases</id>";
      echo "<username>\${env.DEPLOY_USER}</username>";
      echo "<password>\${env.DEPLOY_PASSWORD}</password>";
   echo "</server>";
   # Release site server
   echo "<server>";
      echo "<id>site</id>";
      echo "<username>\${env.DEPLOY_DOCS_USER}</username>";
      echo "<password>\${env.DEPLOY_DOCS_PASSWORD}</password>";
   echo "</server>";
   
   # Development artifacts server
   echo "<server>";
      echo "<id>snapshots</id>";
      echo "<username>\${env.DEPLOY_DEVELOP_USER}</username>";
      echo "<password>\${env.DEPLOY_DEVELOP_PASSWORD}</password>";
   echo "</server>";
   # Release site server
   echo "<server>";
      echo "<id>site-development</id>";
      echo "<username>\${env.DEPLOY_DOCS_DEVELOP_USER}</username>";
      echo "<password>\${env.DEPLOY_DOCS_DEVELOP_PASSWORD}</password>";
   echo "</server>";
   
   echo "</servers>";
   # ---------------------
   # Ends servers settings
   # ---------------------
   
   # --------------
   # Active profile
   # --------------
   
   if [ "$SCM_BRANCH" == "develop" ]; then
      # Development branch
      if [ "$DEPLOY_DOCS" == "true" ]; then
         # Deploying docs
         echo "<activeProfiles>"
            echo "<activeProfile>docs-development</activeProfile>"
         echo "</activeProfiles>"
      fi
   elif [ "$SCM_BRANCH" == "master" ]; then
      # Releases branch
      if [ "$DEPLOY_DOCS" == "true" ]; then
         # Deploying docs
         echo "<activeProfiles>"
            echo "<activeProfile>docs-release</activeProfile>"
         echo "</activeProfiles>"
      fi
   fi
   
   # -------------------
   # Ends active profile
   # -------------------
   
   echo "</settings>";
} >> ~/settings.xml
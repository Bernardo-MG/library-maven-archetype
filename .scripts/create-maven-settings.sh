#!/bin/bash
# This script creates the Maven settings file
# This includes the connection settings, which are loaded from the server's environment
#
# The data generated during this script is sensible information. Don't print it on the console.
#
# The following environmental variables are used:
# - REPO_RELEASES_USER: string, user for the releases repo
# - REPO_RELEASES_PASSWORD: string, password for the releases repo
# - REPO_DEVELOP_USER: string, user for the development repo
# - REPO_DEVELOP_PASSWORD: string, password for the development repo
# - REPO_SITE_USER: string, user for the releases documentation site repo
# - REPO_SITE_PASSWORD: string, password for the releases documentation site repo
# - REPO_SITE_DEVELOP_USER: string, user for the development documentation site repo
# - REPO_SITE_DEVELOP_PASSWORD: string, password for the development documentation site repo
# - SCM_BRANCH: string, the CMS branch from which the code has been taken

{
   echo "<settings>";
   # Servers settings
   echo "<servers>";
   # Releases FTP
   echo "<server>";
      echo "<id>releases</id>";
      echo "<username>\${env.REPO_RELEASES_USER}</username>";
      echo "<password>\${env.REPO_RELEASES_PASSWORD}</password>";
   echo "</server>";
   # DEVELOP FTP
   echo "<server>";
      echo "<id>snapshots</id>";
      echo "<username>\${env.REPO_DEVELOP_USER}</username>";
      echo "<password>\${env.REPO_DEVELOP_PASSWORD}</password>";
   echo "</server>";
   # Site FTP
   echo "<server>";
      echo "<id>site</id>";
      echo "<username>\${env.REPO_SITE_USER}</username>";
      echo "<password>\${env.REPO_SITE_PASSWORD}</password>";
   echo "</server>";
   # Development site FTP
   echo "<server>";
      echo "<id>site-development</id>";
      echo "<username>\${env.REPO_SITE_DEVELOP_USER}</username>";
      echo "<password>\${env.REPO_SITE_DEVELOP_PASSWORD}</password>";
   echo "</server>";
   
   echo "</servers>";
   
   # Active profile
   if [ "$SCM_BRANCH" == "develop" ]; then
      echo "<activeProfiles>"
         echo "<activeProfile>development</activeProfile>"
      echo "</activeProfiles>"
   fi
   
   echo "</settings>";
} >> ~/settings.xml
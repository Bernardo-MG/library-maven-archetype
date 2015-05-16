# Travis integration

The archetype comes ready to integrate with Travis, which will receive each push made to the repository and handle all the CI jobs.

Of course, for this to work the code must be kept in a GitHub repository, one which must have been connected to Travis. Additionally, a series of environmental variable must be correctly set on Travis.

## Environment variables

For the CI to work correctly, a series of environmental variables must be set on Travis:

|Variable|Contents|
|---|---|
|JDK\_DEPLOY|Travis ID for the java version from which to make the publications|

|Variable|Contents|
|---|---|
|REPO\_RELEASES\_USER|User for the releases repository|
|REPO\_RELEASES\_PASSWORD|Password for the releases documentation repository|
|REPO\_SITE\_USER|User for the releases documentation repository|
|REPO\_SITE\_PASSWORD|Password for the releases documentation repository|

|Variable|Contents|
|---|---|
|REPO\_DEVELOP\_USER|User for the snapshots repository|
|REPO\_DEVELOP\_PASSWORD|Password for the snapshots repository|
|REPO\_SITE\_DEVELOP\_USER|User for the snapshots documentation repository|
|REPO\_SITE\_DEVELOP\_PASSWORD|Password for the snapshots documentation repository|

All of these, except for JDK\_DEPLOY, are used to create the Maven settings file. The JDK\_DEPLOY is used instead to pick the JDK from which the deployment will be made.

## Scripts and configuration files

Travis is handled through the configuration file and a series of scripts as follows:

|File|Use|
|---|---|
|.travis|Travis configuration file|
|.scripts/create-maven-settings.sh|Builds the Maven settings file from the environmental variables|
|.scripts/deploy-site.sh|Handles the site deployment job|
|.scripts/deploy.sh|Handles the code deployment job|

The deployment scripts will check three things:

- The current JDK must be the one set on the JDK\_DEPLOY variable.
- The current build is not part of a pull
- The current build has been cloned from a deployable branch

If any of those requirements fails, the script won't make the deployment
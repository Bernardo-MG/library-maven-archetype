# Deployment

New projects come with a few shell scripts meant to ease the deployment procedure, both for artifacts and for documentation.

The idea is running them with the help of a CI service, which will also set up all the variables they require. Files for doing this with [Travis CI][travis] are included in the new project.

Among the required environmental variables are some flags which will be used to know if the deployment scripts should be actually run or not. If any of them is set to false then the script won't run.

These scripts also make a distinction between releases and development versions, which will each be deployed to their own [repositories][repositories].

## Releases and development versions

Maven is capable of knowing if the current version is a release or a development version with a very simple method: if the version field on the POM ends with "-SNAPSHOT" then it is a snapshot, a development version. Otherwise it is a release.

For this reason the "-SNAPSHOT" prefix should be always used for the versions kept in all the development branches of the code repository.

## Scripts

The deployment is handled by the scripts kept on the .scripts folder:

|File|Usage|
|---|---|
|create-maven-settings.sh|Builds the Maven settings file from the environmental variables|
|deploy.sh|Handles the artifact deployment job|
|deploy-site.sh|Handles the site deployment job|

Artifact and documentation deployment use two different shell scripts so they can be run independently.

### create-maven-settings.sh

Deploying into any repository requires a Maven settings file (settings.xml), which states the credentials for said server.

This script takes care of creating such file, taking the access info from the environmental variables. If the [repository IDs][repository-ids] have been changed then the script should be updated accordingly.

An additional thing this script does is setting, through the settings file, the correct deployment profile as active. This is required for deploying the Maven site, to set the release or development repository as needed.

### deploy.sh

This script will deploy the project using the previously generated configuration file, and the repository info from the POM file.

The script itself won't make a distinction between release and development releases, but Maven will do.

### deploy-site.sh

As it is not possible to set more than one site deployment target, two profiles are used to distinguish between the releases and deployment sites repositories. The correct profile should be set into the Maven settings file by using the first script.

Just like the artifact deployment script, this makes no distinction between release and development releases, just grabbing the deployment URL set on the settings file.

## Environmental variables

To make sure the scripts work correctly, a series of environmental variables should be set prior to running them.

### Repositories access data

These define the access data to be used for the repositories contained in the POM file. Check the [Repositories and services][repositories] to find out more.

|Variable|Contents|
|---|---|
|DEPLOY\_USER|User for the releases repository|
|DEPLOY\_PASSWORD|Password for the releases documentation repository|
|DEPLOY\_DOCS\_USER|User for the releases documentation repository|
|DEPLOY\_DOCS\_PASSWORD|Password for the releases documentation repository|

|Variable|Contents|
|---|---|
|DEPLOY\_DEVELOP\_USER|User for the snapshots repository|
|DEPLOY\_DEVELOP\_PASSWORD|Password for the snapshots repository|
|DEPLOY\_DOCS\_DEVELOP\_USER|User for the snapshots documentation repository|
|DEPLOY\_DOCS\_DEVELOP\_PASSWORD|Password for the snapshots documentation repository|

### Deployment flags

These affect the deployment workflow.

|Variable|Contents|
|---|---|
|DEPLOY|Indicates if the artifact should be deployed|
|DEPLOY\_DOCS|Indicates if the documentation should be deployed|

## Deployment workflow

For the deployment to work first a Maven settings file is required, and this is built with the use of the settings script.

Afterward both the artifact and the documents deployment scripts can be run, the order does not matter.

But just running them won't make it work, first they will check if the deployment is allowed, which means passing a series of checks:

![Deployment workflow check][deployment-workflow-check]

- The code should not come from a pull request
- The correct deployment flag should be set
- The code should come from the master or development branch

If any of these checks fails, the deployment won't even begin.

[deployment-workflow-check]: ./images/deployment_check_workflow.png
[repositories]: ./repositories.html
[travis]: ./travis.html

[repositories]: ./repositories.html
[repository-ids]: ./repositories.html#Repository_IDs
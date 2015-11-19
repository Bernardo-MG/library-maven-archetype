# Deployment

The Archetype includes a few shell scripts meant to ease the deployment procedure.

This applies both for artifacts and for documentation and will run along the CI service, which will require a set of environmental variables to be correctly set. Note that the project will be set to work with [Travis CI][travis-section].

Among these environmental variables are some flags which will be used to decide if the deployment scripts should be actually run or not.

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

Deployment follows a simple workflow:

1. The code source branch is checked to find out if it is a pull
    * In case of it being a pull the deployment ends
2. Maven settings file is created.
3. Checks if the deployment flag is set
    * Code and site deployments have their own flag. If any of them is set to false then the related deployment is skipped.
4. Checks if the branch is valid
    * Only code from the master and develop branches can be used for deployment

While this is not the exact way this is handled, as each script will check if it can run independently, it gives a general overview of how it works.

[repositories]: ./repositories.html

[repositories]: ./repositories.html
[repository-ids]: ./repositories.html#artifactrepositoriesids

[travis-section]: ./travis.html

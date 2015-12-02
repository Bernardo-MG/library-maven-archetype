# Deployment

The Archetype prepares the project for deploying both the code artifacts and the Maven site with the help of scripts and configuration files meant, both, for a CI service, more exactly for [Travis][travis-section].

This service will require a few environmental variables to be set before the deployment process can work, as these will be needed for things such as authentication or shaping the deployment flow.

## Releases and development versions

Maven can find out if the current version is a release or a development version with a very simple method: if the version field on the POM ends with "-SNAPSHOT" then it is a snapshot, a development version. Otherwise it is a release.

This is used automatically by Maven when deploying, so as long as the [repositories][repositories] are correctly configured all the artifacts will be published on the correct place.

## Environmental variables

To make sure the scripts work as expected, a series of environmental variables should be set prior to running them.

If any of them is left unset the scripts will exit with an error value.

### Repositories access data

These define the access data to be used for the [repositories][repositories].

#### Release deployment variables

|Variable|Type|Contents|
|---|---|---|
|DEPLOY\_USER|String|User for the releases repository|
|DEPLOY\_PASSWORD|String|Password for the releases documentation repository|
|DEPLOY\_DOCS\_USER|String|User for the releases documentation repository|
|DEPLOY\_DOCS\_PASSWORD|String|Password for the releases documentation repository|

#### Development deployment variables

|Variable|Type|Contents|
|---|---|---|
|DEPLOY\_DEVELOP\_USER|String|User for the snapshots repository|
|DEPLOY\_DEVELOP\_PASSWORD|String|Password for the snapshots repository|
|DEPLOY\_DOCS\_DEVELOP\_USER|String|User for the snapshots documentation repository|
|DEPLOY\_DOCS\_DEVELOP\_PASSWORD|String|Password for the snapshots documentation repository|

### Deployment variables

These will modify the deployment workflow. The included CI configuration file already takes care of them.

|Variable|Type|Contents|
|---|---|---|
|VERSION\_TYPE|[release|develop|other]|Indicates if the code is for a release, development or other type of version.|

### Deployment flags

These affect the deployment workflow. The included CI configuration file already takes care of them.

|Variable|Type|Contents|
|---|---|---|
|DEPLOY|Boolean|Indicates if the artifact should be deployed|
|DEPLOY\_DOCS|Boolean|Indicates if the documentation should be deployed|

### CI flags

Indicates the current status of the continuous integration workflow. The included CI configuration file already takes care of them.

|Variable|Type|Contents|
|---|---|---|
|PULL_REQUEST|Boolean|Meant for CI. Indicates if the code is part of a pull request|

## Deployment validation

Before deploying, each script will check the deployment variables to make sure the environment is valid. If any of the following conditions is met the script won't start:

- The code has been taken from a branch which is part of a pull request (only makes sense when using CI and pull requests).
- The code is not marked as a release or development version.
- The deployment flag is set to false.

## Deployment profiles

A few deployment profiles are included in the POM, and the deployment scripts make use of them.

|Profile|Description|Used in|
|---|---|---|
|deployment|General deployment profile to set up the deployment environment. Mostly this is done by disabling testing for faster deployment.|Deployment scripts, which will set this profile as active|
|deploy-site-release|Release Maven Site deployment profile. Sets the site release repository.|Settings script, which will set as active the correct site deployment profile.|
|deploy-site-development|Development Maven Site deployment profile. Sets the site deployment repository.|Settings script, which will set as active the correct site deployment profile.|

## Scripts

The *.scripts* folder includes various scripts for easily managing the deployment process:

|File|Usage|
|---|---|
|create-maven-settings.sh|Builds the Maven settings file from the environmental variables|
|deploy.sh|Handles the artifact deployment job|
|deploy-site.sh|Handles the site deployment job|

As it can be seen, there is a script for code artifacts and another documentation to allow deploying both independently.

### create-maven-settings.sh

The Maven settings file includes configuration data required for the deployment process. The most important being the credentials for the repositories which will host the artifacts.

In case the file is missing from the deployment environment this script can be used to create it from the environmental variables. Note that it will include references to the default [repository IDs][repository-ids], so if these are changes the script should be edited too.

Additionally the script will set, on the settings file, the deployment profile to be used.

### deploy.sh

This script will deploy the project. A Maven settings file is required for this, and the POM should include information for a repository and a snapshots repository.

The reason for requiring both is that while the script itself won't make a distinction between release and development versions, Maven, as commented before, does, and will deploy them on the correct repository.

### deploy-site.sh

As it is not possible to set more than one site deployment target, two profiles are included in the POM to distinguish between the releases and deployment sites repositories.

The correct profile should be set before calling the script. This is taken care by the Maven settings script, which will set as active the required profile.

[repositories]: ./repositories.html

[repositories]: ./repositories.html
[repository-ids]: ./repositories.html#artifactrepositoriesids

[travis-section]: ./travis.html

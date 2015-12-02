# Deployment

The Archetype prepares the project for deploying both the code artifacts and the Maven site with the use of scripts and configuration files.

But this is meant to be done through a CI service, which by default will be [Travis][travis-section]. Such a service will also need a set of environmental variables detailed below to define the deployment environment, covering things such as authentication data or deployment flags.

## Releases and development versions

Maven can find out if the current version is a release or a development version with a very simple method: if the version field on the POM ends with "-SNAPSHOT" then it is a snapshot, a development version. Otherwise it is a release.

This feature will be used to publish development and release code artifacts each into their own [repositories][repositories].

## Environmental variables

To make sure the scripts work correctly, a series of environmental variables should be set prior to running them.

### Repositories access data

These define the access data to be used for the repositories contained in the POM file. Check the [repositories section][repositories] to find out more.

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

These affect the deployment workflow. The included Travis configuration file already takes care of them.

|Variable|Type|Contents|
|---|---|---|
|VERSION\_TYPE|[release|develop|other]|Indicates if the code is for a release, development or other type of version.|

### Deployment flags

These affect the deployment workflow. The included Travis configuration file already takes care of them.

|Variable|Type|Contents|
|---|---|---|
|DEPLOY|Boolean|Indicates if the artifact should be deployed|
|DEPLOY\_DOCS|Boolean|Indicates if the documentation should be deployed|

### CI flags

Indicates the current status of the continuous integration workflow. The included Travis configuration file already takes care of them.

|Variable|Type|Contents|
|---|---|---|
|PULL_REQUEST|Boolean|Meant for CI. Indicates if the code is part of a pull request|

## Environmental variables configuration

If using the the [Continuous Integration][travis-section] configuration, some of the enviromental variables will be taken care of by the configuration files.

The list of each variable and their status is as follows. Any variable which is not taken care of should be set in the deployment environment, which means it should be added as a variable to the CI service.

|Variable|Taken care of|
|---|---|
|DEPLOY|Yes|
|DEPLOY\_DOCS|Yes|
|PULL\_REQUEST|Yes|
|VERSION\_TYPE|Yes|
|DEPLOY\_USER|No|
|DEPLOY\_PASSWORD|No|
|DEPLOY\_DOCS\_USER|No|
|DEPLOY\_DOCS\_PASSWORD|No|
|DEPLOY\_DEVELOP\_USER|No|
|DEPLOY\_DEVELOP\_PASSWORD|No|
|DEPLOY\_DOCS\_DEVELOP\_USER|No|
|DEPLOY\_DOCS\_DEVELOP\_PASSWORD|No|

## Deployment validation

Before deploying each script will make sure a few required conditions are met, and will stop if any of them fails. This way it is possible controlling when the deployment is done.

In general they will stop if any of the following conditions is met:

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

As it can be seen, there is a script for code artifacts and another documentation. This way it is possible deploying both independently.

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

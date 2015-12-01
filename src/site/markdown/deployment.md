# Deployment

The Archetype readies to project for deploying both code artifacts and the Maven site.

For this a CI service is required, which by default will be [Travis CI][travis-section]. Such a service will additionally need a set of environmental variables which will define the deployment environments, and which will cover things such as authentication data or deployment flags.

## Releases and development versions

Maven is capable of knowing if the current version is a release or a development version with a very simple method: if the version field on the POM ends with "-SNAPSHOT" then it is a snapshot, a development version. Otherwise it is a release.

This feature will be used to publish development and release code artifacts each into their own [repositories][repositories].

## Environmental variables

To make sure the scripts work correctly, a series of environmental variables should be set prior to running them.

### Repositories access data

These define the access data to be used for the repositories contained in the POM file. Check the [repositories section][repositories] to find out more.

#### Release deployment variables

|Variable|Contents|
|---|---|
|DEPLOY\_USER|User for the releases repository|
|DEPLOY\_PASSWORD|Password for the releases documentation repository|
|DEPLOY\_DOCS\_USER|User for the releases documentation repository|
|DEPLOY\_DOCS\_PASSWORD|Password for the releases documentation repository|

#### Development deployment variables

|Variable|Contents|
|---|---|
|DEPLOY\_DEVELOP\_USER|User for the snapshots repository|
|DEPLOY\_DEVELOP\_PASSWORD|Password for the snapshots repository|
|DEPLOY\_DOCS\_DEVELOP\_USER|User for the snapshots documentation repository|
|DEPLOY\_DOCS\_DEVELOP\_PASSWORD|Password for the snapshots documentation repository|

### Deployment flags

These affect the deployment workflow. The included Travis configuration file already takes care of them.

|Variable|Contents|
|---|---|
|DEPLOY|Indicates if the artifact should be deployed|
|DEPLOY\_DOCS|Indicates if the documentation should be deployed|

### CI flags

Indicates the current status of the continuous integration workflow. The included Travis configuration file already takes care of them.

|Variable|Contents|
|---|---|
|PULL_REQUEST|Meant for CI. Indicates if the code is part of a pull request|

## Environmental variables configuration

If using the other features of the project, mostly the [Continuous Integration][travis-section] configuration, some of the enviromental variables will be taken care of.

The list of each variable and their status is as follows. Remember that if the CI and deployment scripts are modified this can change.

|Variable|Taken care of|Comments|
|---|---|
|DEPLOY\_USER|No|Should be set on the deployment environment|
|DEPLOY\_PASSWORD|No|Should be set on the deployment environment|
|DEPLOY\_DOCS\_USER|No|Should be set on the deployment environment|
|DEPLOY\_DOCS\_PASSWORD|No|Should be set on the deployment environment|
|DEPLOY\_DEVELOP\_USER|No|Should be set on the deployment environment|
|DEPLOY\_DEVELOP\_PASSWORD|No|Should be set on the deployment environment|
|DEPLOY\_DOCS\_DEVELOP\_USER|No|Should be set on the deployment environment|
|DEPLOY\_DOCS\_DEVELOP\_PASSWORD|No|Should be set on the deployment environment|
|DEPLOY|Yes|Taken care of in the CI configuration file|
|DEPLOY\_DOCS|Yes|Taken care of in the CI configuration file|
|PULL_REQUEST|Yes|Taken care of in the CI configuration file|

## Deployment validation

The deployment scripts check make sure a few required conditions are true before running. This way they only run when wanted and required.

In general they will stop if any of the following is false:

- The code has been taken from a branch which is not part of a pull request (only makes sense when using CI and pull requests).
- The code has been taken from the *master* or *development* branches.
- The correct deployment flag is set to true.

## Deployment profiles

A few deployment profiles are included in the POM. These are already taken care of by the deployment scripts, and can be extended as needed.

|Profile|Description|Used in|
|---|---|
|deployment|General deployment profile. Sets up the deployment environment, mostly disabling testing for faster deployment.|Deployment scripts, which will set this profile for deployment|
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

# Deployment

The Archetype includes some shell scripts to ease the deployment procedure. These are meant to be executed through a CI service after changes to code, and will ask to know the branch from which the code has been pulled. If it is one marked for deployment, then this will begin.

During deployment the artifacts and documentation site will be created and uploaded on the correct [repositories][repositories], making a distinction between releases and development versions.

But this process won't work out of the box, for them to work correctly these scripts require a series of environmental variables set.

## Releases and development versions

Maven is capable of knowing if the current version is a release or a development version, and does this with a very simple method: if the version field on the POM ends with "-SNAPSHOT" then it is a snapshot, a development version, otherwise it is a release.

As the scripts make use of this feature, the "-SNAPSHOT" prefix should be always used for the versions kept in all the branches of the code repository, except for the ones keeping the releases.

## Scripts

The deployment is handled by the scripts kept on the .scripts folder:

|File|Usage|
|---|---|
|create-maven-settings.sh|Builds the Maven settings file from the environmental variables|
|deploy.sh|Handles the artifact deployment job|
|deploy-site.sh|Handles the site deployment job|

Artifact and documentation deployment use two different shell scripts so they can be run independently.

### Maven settings file creation script

Deploying into any repository requires a Maven settings file, which states the credentials for said server.

This script takes care of creating such file, taking the access info from environmental variables. If the [repository IDs](./repos.html#Repository_IDs) have been changed the script should be updated accordingly.

An additional thing this script does is setting, through the settings file, the 'development' profile as active, if the code comes from the 'develop' branch.

### Artifact deployment script

This script will deploy the project using the generated configuration file, and the repository info on the POM file.

As this implies, the script itself won't make a distinction between release and development releases, but Maven will do.

### Site deployment script

As it is not possible to set more than one site deployment target, two profiles are used to distinguish between the releases and deployment sites repositories.

The correct profile will be set into the Maven settings file, and this script, as the artifact deployment one, will just make use of said settings file.

## Environmental variables

To make sure the scripts work correctly, a series of environmental variables are required. These should be set to valid values on the machine running the scripts.

### Repositories access data

These define the access data to be used for the repositories defined on the POM file. Check the [Repositories and services](./repos.html) to find out more.

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
[repositories]: ./repos.html
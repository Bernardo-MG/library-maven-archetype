# Deployment


Any project generated with the Archetype will include a series of shell scripts which take care of the deployment process, both for the artifacts and for the [Maven site][maven-site], and segregating the release and development deployments.

These files won't work out of the box. First they will need a series of environmental variables set.

## Scripts

The deployment is handled by the scripts on the .scripts folder:

|File|Use|
|---|---|
|create-maven-settings.sh|Builds the Maven settings file from the environmental variables|
|deploy.sh|Handles the artifact deployment job|
|deploy-site.sh|Handles the site deployment job|

### Maven settings file script

The script will mostly take the access-related environmental values and create a Maven settings file from them. Not that this requires the [repository IDs](./repos.html#Repository_IDs) set on the POM, so if these change the file won't work.

Additionally, it sets the development profile as active if the current branch is the 'develop' one.

### Artifact deployment script

This script will deploy the project using the generated configuration file, and the repository info on the POM file.

### Site deployment script

As it is not possible to set more than one site deployment target, two profiles are used to distinguish between the releases and deployment sites repositories.

The correct profile will be loaded from the Maven configuration file.

## Environmental variables

### Repositories access data

These define the access data to be used for the repositories defined on the POM file. Check the [Repositories and services](./repos.html) to find out more.

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

### Deployment flags

These affect the deployment workflow.

|Variable|Contents|
|---|---|
|DEPLOY|Indicates if the artifact should be deployed|
|DEPLOY\_DOCS|Indicates if the documentation should be deployed|

## Deployment workflow

[![Deployment workflow][deployment-workflow]][deployment-workflow]

For the deployment to work first a Maven settings file is required, and this is built with the use of the settings script.

Afterward both the artifact and the documents deployment scripts can be run, no matter the order.

But just running them won't make it work, first they will check if the deployment is allowed, which means passing a series of checks:

[![Deployment workflow check][deployment-workflow-check]][deployment-workflow-check]

- The code should not come from a pull request
- The correct deployment flag should be set
- The code should come from the master or development branch

If any of these checks fails, the deployment won't be done.

[deployment-workflow]: ./images/deployment_workflow.png
[deployment-workflow-check]: ./images/deployment_check_workflow.png
[maven-site]: ./site.html
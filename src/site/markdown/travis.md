# Travis integration

The archetype comes ready to integrate with Travis, which will receive each push made to the repository and handle all the CI jobs.

Of course, for this to work the code must be kept in a GitHub repository, one which must have been connected to Travis. Additionally, a series of environmental variable must be correctly set on Travis.

## The CI cycle

The archetype is configured for a simple CI cycle based on three steps:

- Building and testing the project
- Publishing documentation
- Publishing code artifacts

How these steps will be executed will depend on the target. There are also three targets, and they depend on the code repository branch on which the code is stored:

- Deployment target, when the code comes from the master branch
- Snapshot target, when the code comes from the develop branch
- Feature target, when the code comes from any other branch

### Deployment

When a push is done to the 'master' branch the deployment target is selected.

After building and testing, the project will be sent to the releases repository, and the documentation will be published on the releases documentation repository.

### Snapshot

When a push is done to the 'develop' branch the snapshot target is selected.

After building and testing, the project will be sent to the snapshots repository, and the documentation will be published on the snapshots documentation repository.

### Feature

Any push to any other branch is considered a feature. Nothing will be published in any repository, but the building and testing will still be done.

## Repositories

Artifacts will be uploaded to the artifacts defined on the POM. For more information check the repositories section.

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

## Scripts and configuration files

Travis is handled through the configuration file and a series of scripts as follows:

|File|Use|
|---|---|
|.travis|Travis configuration file|
|.scripts/create-maven-settings.sh|Builds the Maven settings file from the environmental variables|
|.scripts/deploy-site.sh|Handles the site deployment job|
|.scripts/deploy.sh|Handles the code deployment job|
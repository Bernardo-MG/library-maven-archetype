# Deployment

The Archetype can be deployed with ease as part of a Continuous Integration process. While by default it comes ready for [Travis][travis-section] it is easy to adapt to any other service, as long as one understand how it is configured.

## Is this a release, or a development version?

First of all the project version should be set to indicate if this is a development version or a release. As the new project will be a Maven project this can be done just by appending the "-SNAPSHOT" suffix to the version field in the POM.

So, a release version would be set like this:

```
<groupId>com.somwhere</groupId>
<artifactId>project-name</artifactId>
<version>1.2.3</version>
```

While a development version would be like this:

```
<groupId>com.somwhere</groupId>
<artifactId>project-name</artifactId>
<version>1.2.3-SNAPSHOT</version>
```

Just like that Maven will know which [repository][repositories] should be used when deploying. Which is actually the only real impact this will have on the deployment.

## Environmental variables

The included configuration file makes use of a few scripts which require some environmental variables set for flow control.

Make sure they are correctly set on the machine running the CI.

### Repositories access data

These define the credentials for the [repositories][repositories].

Remember this is sensitive information which should not be publicly accessible. Always protect these variables.

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

### Deployment flags

Control flags used to know which artifacts, if any, will be deployed. The included CI configuration file already takes care of them.

|Variable|Type|Contents|
|---|---|---|
|DEPLOY|Boolean|Indicates if the artifact should be deployed|
|DEPLOY\_DOCS|Boolean|Indicates if the documentation should be deployed|

These are just control flags. Even if set the actual deployment may be skipped, depending on various conditions.

## Deployment validation

One of the scripts used for CI will check the current environment, trying to find out if deploying the artifacts is desirable, or even possible.

If any of the following conditions is met the deployment step will be skipped:

- The code has been taken from a branch which is part of a pull request.
- The code is not marked as a release or development version.
- The deployment flag is set to false.

## Deployment profiles

To help with the deployment a few profiles are included in the generated project's POM.

The scripts used for CI already take care of them.

|Profile|Description|
|---|---|
|deployment|General deployment profile to set up the deployment environment. Mostly this is used to disable testing for faster deployment.|
|deploy-site-release|Release Maven Site deployment profile. Sets the site release repository.|
|deploy-site-development|Development Maven Site deployment profile. Sets the site deployment repository.|

Having a Maven site profile for releases and another for development allows having two Maven sites, one for each kind of version.

## Scripts

While the project does not include any script, a few of them are acquired by the included configuration file. These come from the [ci-shell-scripts][ci-shell-scripts] project, and simplify much of the deployment work.

|Script|Usage|
|---|---|
|create-maven-settings.sh|Builds the Maven settings file from the environmental variables|
|deploy.sh|Handles the artifact deployment job|
|deploy-site.sh|Handles the site deployment job|

Having a script for artifact deployment, and another for the Maven Site allows handling both deployments independently.

### create-maven-settings.sh

As some of the information required for deployment is too sensitive for being stored in the code repository, this script will prepare a Maven settings file which will read credentials from the machine's environmental variables.

Additionally, it will also set the Maven Site profile to be used.

[repositories]: ./repositories.html

[repositories]: ./repositories.html

[travis-section]: ./travis.html

[ci-shell-scripts]: https://github.com/Bernardo-MG/ci-shell-scripts

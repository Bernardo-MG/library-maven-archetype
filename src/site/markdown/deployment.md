# Deployment

The Archetype can be deployed with ease as part of a Continuous Integration process. While by default it comes ready for [Github Workflow][github-workflow] it is easy to adapt to any other service, as long as one understand how it is configured.

## Is This a Release, or a Development Version?

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

## Environmental Variables

The included configuration file makes use of a few scripts which require some environmental variables set for flow control.

Make sure they are correctly set on the machine running the CI. For Github check the [environment variables][github-env] docs.

### Repositories Access Data

These define the credentials for the [repositories][repositories].

Remember this is sensitive information which should not be publicly accessible. Always protect these variables.

#### Release Deployment Variables

|Variable|Type|Contents|
|---|---|---|
|DEPLOY\_USER|String|User for the releases repository|
|DEPLOY\_PASSWORD|String|Password for the releases documentation repository|
|DEPLOY\_DOCS\_SITE|String|URL for the releases documentation repository|
|DEPLOY\_DOCS\_USER|String|User for the releases documentation repository|
|DEPLOY\_DOCS\_PASSWORD|String|Password for the releases documentation repository|

#### Development Deployment Variables

|Variable|Type|Contents|
|---|---|---|
|DEPLOY\_DEVELOP\_USER|String|User for the snapshots repository|
|DEPLOY\_DEVELOP\_PASSWORD|String|Password for the snapshots repository|
|DEPLOY\_DOCS\_DEVELOP\_SITE|String|URL for the releases documentation repository|
|DEPLOY\_DOCS\_DEVELOP\_USER|String|User for the snapshots documentation repository|
|DEPLOY\_DOCS\_DEVELOP\_PASSWORD|String|Password for the snapshots documentation repository|

## Deployment Profiles

To help with the deployment a few profiles are included in the generated project's POM.

The scripts used for CI, and the included Github Workflow file, already take care of them.

|Profile|Description|
|---|---|
|deployment|General deployment profile to set up the deployment environment. Used to disable testing for faster deployment.|
|deployment-release|Release deployment profile. Sets the site release repository.|
|deployment-development|Development deployment profile. Sets the site deployment repository.|

Having a Maven site profile for releases and another for development allows having two Maven sites, one for each kind of version.

[repositories]: ./repositories.html

[repositories]: ./repositories.html

[github-workflow]: ./ghworkflow.html

[github-env]: https://docs.github.com/en/actions/configuring-and-managing-workflows

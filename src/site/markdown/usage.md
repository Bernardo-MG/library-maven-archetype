# Using the archetype

To install the project into the local archetypes repository use the following command:

```
mvn clean install archetype:update-local-catalog
```

## Variables

Several variables are defined for the archetype and can be modified when creating a new project with it. All of them have a default value assigned.

### Source repository

|Variable|Use|
|---|---|
|sourceControlUrl|Link to the code repository|
|sourceControlConnection|Connection for the code repository|

### Issues tracker

|Variable|Use|
|---|---|
|issuesUrl|Link to the issues tracker|
|issuesSystem|Issues tracker being used|

### Continuous integration

|Variable|Use|
|---|---|
|ciUrl|Link to the continuous integration service|
|ciSystem|Continuous integration service being used|

### Artifacts repositories

|Variable|Use|
|---|---|
|repoRelease|URL for publishing into the releases code repository|
|repoSnapshot|URL for publishing into the snapshots code repository|
|repoReleaseDownload|URL for acquiring code from the releases code repository|
|repoSnapshotDownload|URL for acquiring code from the snapshots code repository|

### Sites repositories

|Variable|Use|
|---|---|
|siteRelease|URL for publishing into the releases documents repository|
|siteDevelop|URL for publishing into the development documents repository|
|siteReleasePublic|Link for consulting the releases documents|
|siteDevelopPublic|Link for consulting the development documents|

### Javadocs

|Variable|Use|
|---|---|
|javadocRelease|Link for the releases Javadocs|
|javadocDevelop|Link for the development Javadocs|

### Organization

|Variable|Use|
|---|---|
|organizationName|Name of the organization|
|organizationUrl|Link to the organization's webpage|

### JAR

|Variable|Use|
|---|---|
|jarManifestName|Name for the project on the JAR manifest|

### Site

|Variable|Use|
|---|---|
|siteDownloadUrl|Download link for the site|
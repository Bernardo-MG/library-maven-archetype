# Using the archetype

To install the project into the local archetypes repository use the following command:

```
mvn clean install archetype:update-local-catalog
```

## Variables

Several variables are defined for the archetype and can be modified when creating a new project with it. All of them have a default value assigned.

### Repositories

|Variable|Use|
|---|---|
|repoUserId|ID of the user on GitHub|
|repoProjectId|Name of the project on GitHub|

These IDs should be on lowercase, for compatibility with Travis.

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

### Organization

|Variable|Use|
|---|---|
|organizationName|Name of the organization|
|organizationUrl|Link to the organization's webpage|

### JAR

|Variable|Use|
|---|---|
|jarManifestName|Name for the project on the JAR manifest|
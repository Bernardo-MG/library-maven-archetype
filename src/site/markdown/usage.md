# Using the archetype

Right now there is no public archetypes catalog containing this archetype. It must be downloaded from the code repository and installed manually.

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

These IDs should be on lowercase, for compatibility with Travis.

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
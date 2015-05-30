# Repositories and services

As part of the project life cycle a series of repositories must be set up to store different artifacts, as follows:

- GitHub repository, for storing the code
- Bintray repository, for the code releases
- Maven snapshots repository, for the snapshots
- Documentation repository, to store the Maven sites for both the release and latest snapshot

The way to set them all up goes beyond the scope of this manual, but usually it's a simple job, and in many cases just little more than registering on a web page.

Note that the GitHub repository is expected to be integrated with Travis CI. To find out more about how is this used check the [Travis](./travis.html) section. Also check the [project life cycle](./lifecycle.html) section.

## Repository IDs

All the artifacts repositories, which does not include the code repository, are handled by Maven, being defined on the POM with the following IDs:

|ID|Repository|
|---|---|
|releases|Release artifacts repository|
|snapshots|Snapshot artifacts repository|
|site|Releases documentation site repository|
|site-development|Development documentation site repository|

## Required repositories

---

### Code repository

This is expected to be a repository on GitHub.

Maven does not handle the code repository. It is defined in the POM, and it is a vital part of the project life cycle, but is not directly handled by Maven.

Instead, the developers will push changes to it, and the CI service will react to such changes by reading the configuration files including in the project.

For more information about this check the [Travis](./travis.html) section, which is the CI service expected by default to be used.

### Documentation repository

The documentation repository store a Maven site for the project, similar to this one, which will also include the Javadocs. It will store the documentation for both the current release and the latest snapshot.

This is a publicly accessible FTP, and any host offering this kind if access can be used.

### Releases repository

This repository is expected by default to be the generic Maven repository on Bintray. Both the download URL for dependencies, and the download link on the site, are configured for this.

### Snapshots repository

The snapshots repository is just a publicly accessible FTP site prepared to work with Maven, and will be used both for uploading and for downloading the latest snapshots.

There is no additional requirement for this, so it can be set on any FTP host. Preferably one under control of the developer.

---

## Bintray and linked repositories

By default, the archetype is meant to be used with Bintray. This means that it is also possible to ask for the releases repo to be linked with JCenter and oss.jfrog.org.

The second, oss.jfrog.org, gives an snapshots repository for open source projects, but as it is needed to ask for it, this repository is not included in the configuration.

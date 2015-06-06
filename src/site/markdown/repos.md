# Repositories and services

The archetype is prepared to work applying a simple CI cycle, which will make use of various free repository services. Being the only exception the documentation, which requires a FTP server to store the Maven site.

The required repositories are:

- GitHub repository, for storing the code
- Bintray repository, for the code releases
- Sonatype OSS repository, for the snapshots
- Documentation repository, to store the Maven sites for both the release and latest snapshot

All these repositories should have been set up before creating a new project, or otherwise the CI process won't work correctly. The way to set them all up goes beyond the scope of this manual, but usually it's a simple job, which requires little more than registering on a web page.

## Integrating the repositories

The repositories will be integrated with the use of Travis, a free CI service. To find out more about how is this used check the [Travis](./travis.html) section. Also check the [project life cycle](./lifecycle.html) section.

But in shot, Travis will take care of building the code submitted to Github, and then sending the compiled artifacts to Bintray or Sonatype, and the documentation ot the docs repository.

## Repository IDs

Inside the POM, a unique id has been given to each repository, except for the code repo, which does not require one:

|ID|Repository|
|---|---|
|releases|Release artifacts repository|
|snapshots|Snapshot artifacts repository|
|site|Releases documentation site repository|
|site-development|Development documentation site repository|

## Repositories in detail

---

### Code repository

By default, a GitHub repository.

Maven does not handle the code repository. It is defined in the POM, and it is a vital part of the project life cycle, but is not directly handled by Maven.

Instead, the developers will push changes to it, and the CI service will react to such changes by reading the configuration files including in the project.

For more information about this check the [Travis](./travis.html) section, which is the CI service expected by default to be used.

### Documentation repository

Should be a FTP server.

The documentation repository store a Maven site for the project, similar to this one, which will also include the Javadocs. It will store the documentation for both the current release and the latest snapshot.

This is a publicly accessible FTP, and any host offering this kind if access can be used.

### Releases repository

By default, a Bintray repo.

Both the download URL for dependencies, and the download link on the site, are configured for this.

### Snapshots repository

By default, OSS Sonatype.

Alternatively, it is possible to use a FTP server, if one does not wish to go through the process of getting into Sonatype.

---

## Bintray and other linked repositories

By default, the archetype is meant to be used with Bintray. This means that it is also possible to ask for the releases repo to be linked with JCenter and oss.jfrog.org.

More importantly, Bintray also allows publishing releases into Sonatype, allowing to use Maven's default repository.

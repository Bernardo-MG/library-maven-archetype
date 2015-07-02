# Repositories and services

The archetype is prepared to work applying a simple CI cycle, which will make use of various free repository services. Being the only exception the documentation, which requires a FTP server to store the Maven site, as I have not found a free service for this.

The required repositories are:

- [GitHub](https://github.com/) repository, for storing the code
- [Bintray](https://bintray.com/) repository, for the code releases
- [Sonatype OSS](https://oss.sonatype.org/) repository, for the snapshots
- Documentation repository, to store the Maven sites for both the release and latest snapshot

All these repositories should have been set up before creating a new project, or otherwise the CI process won't work correctly. The way to set them all up goes beyond the scope of this manual, but usually it's a simple job, which requires little more than registering on a web page.

## Integrating the repositories

The repositories will be integrated with the use of [Travis](https://travis-ci.org), a free CI service. To find out more about how is this used check the [Travis section](./travis.html). Also check the [project life cycle](./lifecycle.html) section.

But in short, Travis will take care of building the code submitted to Github, and then sending the compiled artifacts to Bintray or Sonatype, and the documentation ot the docs repository.

Just remember to connect them, which just required a free account, and following [this guide](http://docs.travis-ci.com/user/getting-started/#To-get-started-with-Travis-CI%3A).

## JCenter, OSS Sonatype and Maven Central

Using Bintray, it is possible to link the releases depo to JCenter, OSS Sonatype and Maven central. Meaning that it won't be necessary to add repositories info to the POM along the dependencies.

Connecting to JCenter is easy, just follow [this guide](https://bintray.com/docs/usermanual/uploads/uploads_includingyourpackagesinjcenter.html).

To connect Bintray to OSS Sonatype follow [this guide](http://blog.bintray.com/2014/02/11/bintray-as-pain-free-gateway-to-maven-central/). Linking to Sonatype also means that the repository will be mirrored on Maven Central.

### OSS Sonatype snapshots

The OSS Sonatype releases repository grants access to the snapshots repository. This can be found at the following URL:

```
https://oss.sonatype.org/content/groups/staging
```

## Repository IDs

Inside the POM, a unique id has been given to each repository, except for the code repo, which does not require one:

|ID|Repository|
|---|---|
|releases|Release artifacts repository|
|snapshots|Snapshot artifacts repository|
|site|Releases documentation site repository|
|site-development|Development documentation site repository|

These ids will be used mostly on the servers configuration file. This file may be created to manually deploy the project, but actually it is recommended to just make use of the Travis configuration files.

You may check how this is done on the [Travis](./travis.html) section. But mainly the '.scripts/create-mave-settings.sh' script will generate this file from the Travis environment variables.

## Repositories in detail

---

### Code repository

A GitHub repository.

Maven does not handle the code repository. It is defined in the POM, and it is a vital part of the project life cycle, but is not directly handled by Maven.

Instead, the developers will push changes to it, and the CI service will react to such changes by reading the configuration files including in the project.

For more information about this check the Travis section, which is the CI service expected by default to be used.

### Documentation repository

Should be a FTP server.

The documentation repository stores a Maven site for the project, similar to this one, which will also include the Javadocs. While two repositores can be configured, one for the current release and another for the latest snapshot, it is actually recommended to use one. Just set up two different accounts, to deploy both sites at different locations.

This should be a publicly accessible FTP, with the only additional requirement being some way to access the uploaded docs.

### Releases repository

A Bintray repo.

Both the download URL for dependencies, and the download link on the site, are configured for this.

Note that it is possible to link this repository to JCenter, OSS Sonatype and Maven Central. If this is done, most Maven versions will find the project releases automatically.

### Snapshots repository

OSS Sonatype.

Alternatively, it is possible to use a FTP server, if one does not wish to go through the process of getting into Sonatype. Just pushing into it will prepare the FTP to be used as a simple Maven repository.

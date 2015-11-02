# Repositories and services

The Archetype will set up the project to work with the following repositories:

|Repository|Type of repository|
|---|---|
|[GitHub](https://github.com/)|Code|
|[Bintray](https://bintray.com/)|Releases|
|[Sonatype OSS](https://oss.sonatype.org/)|Snapshots|
|FTP|Documentation (Maven site), for both releases and development versions|

As I've been unable to locate any free documentation repository for the Maven Site, the developers should acquire and handle a FTP server by themselves.

Of course the other repositories will require the user first to be registered and then to set up the repositories. This is mostly a straightforward job, explained in each of their webpages.

## Continuous integration

The new project will be ready to help all these repositories work together. Documents and artifacts should be published each time a release is created, and code should be always be tested after pushing it to the code repository.

This can be achieved with the help of a continuous integration service. More exactly, with the help of [Travis](https://travis-ci.org), which is free for open source projects.

To find out more about this check the [Travis section](./travis.html). For now all that it matters is knowing that the CI service join together the various repositories, and that [this guide](http://docs.travis-ci.com/user/getting-started/#To-get-started-with-Travis-CI%3A) explains how to set it up.

## Mirroring to JCenter, OSS Sonatype and Maven Central

Using Bintray it is possible to link the releases repository to JCenter, Sonatype OSS and Maven central. Making most dependency managers, including the most common Maven configurations, able to acquire the project without adding any new repository info.

The process for achieving this is, mostly, very simple:

First it is required connecting the Bintray repository to JCenter. This is easy, just follow [this guide](https://bintray.com/docs/usermanual/uploads/uploads_includingyourpackagesinjcenter.html).

To connect Bintray to OSS Sonatype follow [this other guide](http://blog.bintray.com/2014/02/11/bintray-as-pain-free-gateway-to-maven-central/). After this you will end with a Sonatype account, and your own group Id under which your projects can be released.

With all these repositories linked, just by updating the releases on Bintray they will get replicated in JCenter. And while updating the project on Maven Central still requires a manual step, it is much easier than the alternative.

### OSS Sonatype snapshots

After setting up the Sonatype account for Bintray you will be able to release snapshots to the OSS Sonatype snapshots repository. The continuous integration process for which the new project is ready will take care of this.

Remember that it may not be possible to add artifacts to OSS Sonatype until the project has at least one release on Maven Central.

## Repository IDs

A unique id has been given to each repository in the POM:

|ID|Repository|Default service|
|---|---|---|
|releases|Release artifacts repository|Bintray|
|snapshots|Snapshot artifacts repository|Sonatype OSS|
|site|Releases documentation site repository|FTP|
|site-development|Development documentation site repository|FTP|

It is not recommended editing these ids, as they are references in various places, such as the [deployment scripts](./deployment.html#Scripts).

## Source repository and development versions

The deployment scripts included in the new project make use of a Maven feature for finding out if the project is a release or a development version. If the version field on the POM ends with "-SNAPSHOT" then it is a snapshot, a development version. Otherwise it is a release.

For this reason the "-SNAPSHOT" prefix should be always used for the versions kept in all the development branches of the code repository.


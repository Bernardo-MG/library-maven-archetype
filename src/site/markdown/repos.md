# Repositories and services

The Archetype will set up the project for the following repositories:

|Repository|Use|
|---|---|
|[GitHub](https://github.com/)|Code|
|[Bintray](https://bintray.com/)|Releases|
|[Sonatype OSS](https://oss.sonatype.org/)|Snapshots|
|FTP|Maven sites, for both releases and development versions|

As I've been unable to find any free documentation repository for the Maven Site, the developers should acquire and handle a FTP server by themselves.

The other repositories are easy to set up, requiring mostly signing into a website, but that goes beyond the scope of this document, and should be checked on each service's page.

## Integrating the repositories

To make these repositories work together, which mostly means publishing artifacts and documents after applying changes to the code repository, [Travis](https://travis-ci.org), a free CI service, can be used. To find out more about how it is used check the [Travis section](./travis.html).

Just remember to connect Github and Travis together, which just required a free account and following [this guide](http://docs.travis-ci.com/user/getting-started/#To-get-started-with-Travis-CI%3A).

## JCenter, OSS Sonatype and Maven Central

Using Bintray it is possible to link the releases repository to JCenter, OSS Sonatype and Maven central. With this most dependency managers, including the common Maven configurations, will be able to acquire the project without adding any new repository info.

Connecting Bintray to JCenter is easy, just follow [this guide](https://bintray.com/docs/usermanual/uploads/uploads_includingyourpackagesinjcenter.html).

To connect Bintray to OSS Sonatype follow [this other guide](http://blog.bintray.com/2014/02/11/bintray-as-pain-free-gateway-to-maven-central/). Linking to Sonatype also means that the repository will be mirrored on Maven Central.

With all these repositories linked, just by updating the releases on Bintray they will get replicated in JCenter. And while updating the project on Maven Central requires a manual step, it is still much easier than the alternative.

### OSS Sonatype snapshots

The Archetype comes prepared to release snapshots into the OSS Sonatype snapshots repository. This requires setting up a Sonatype account and adding the project there, something which is done if the previous guides have been followed.

Remember that it may not be possible to add artifacts to OSS Sonatype until the project has at least one release on Maven Central.

## Repository IDs

A unique id has been given to each repository in the POM:

|ID|Repository|
|---|---|
|releases|Release artifacts repository|
|snapshots|Snapshot artifacts repository|
|site|Releases documentation site repository|
|site-development|Development documentation site repository|

It is not recommended editing these ids, as they are references in various places, such as the [deployment scripts](./deployment.html#Scripts).

# Repositories

To take full advantage of the Archetype various repositories should be prepared. Luckily for most of them there are free services, and the new project will come ready for these, but in the case of the site documentation a private repository should be set up, or otherwise it won't be possible sharing it.

There are four required repositories in total, one of a different kind: SCM, releases, snapshots and Maven site (for both the releases and development version).

Actually, these repositories are not really required, but without them it won't be possible to take advantage of the [deployment][deployment-section] feature. One of the most important ones which this archetype offers, along the continuous integration process which, taking advantage of [Travis][travis-section], requires them for working correctly.

If for some reason the actual services used need to be changed, all the information about the repositories is kept in the POM file, where it can be easily changed.

## SCM

The Source Code Manager is the most important repository, as this is where the code is stored and versioned. By default [GitHub][github] will be used.

### Automatic creation of the SCM URL

The repository's URL will be created by using the repoUserId and the project id Archetype variables in the following Velocity macro:

```
https://www.github.com/${repoUserId}/${artifactId}
```

If the repository does not follow this naming pattern then the resulting URL should be corrected manually.

### Source repository and snapshots versions

The [deployment scripts][deployment-scripts-section] included make use of a Maven feature which finds out if the project is a release or a development version based on a suffix. If the version field on the POM ends with "-SNAPSHOT" then it is a snapshot, a development version. Otherwise it is a release.

For this reason the "-SNAPSHOT" prefix should be always used for the versions kept in all the development branches of the code repository.

## Artifact repositories

Two repositories will be used for the artifacts created from the code. One will be for releases and another for snapshots.

By default [Bintray][bintray] will be used for releases, and [Sonatype OSS][sonatype] for snapshots. Note that Sonatype requires additional configuration which is detailed in the guides below.

### Artifact repositories ids

Both repositories have a unique Id which are used mostly to find out the credentials to use for them during the deployment process.

For this same reason it is not recommended changing them, as some components may stop working.

|ID|Repository|
|---|---|
|releases|Release artifacts repository|
|snapshots|Snapshot artifacts repository|

### Mirroring to JCenter, OSS Sonatype and Maven Central

Using Bintray it is possible to link the releases repository to JCenter, Sonatype OSS and Maven central. This way most dependency managers, including the usual Maven configurations, will be able to acquire the project without adding any new repository info.

The process for achieving this is, mostly, very simple:

The first step is required and consists on connecting the Bintray repository to JCenter. This is easy, just follow [this guide][jcenter-guide].

Then connect Bintray to OSS Sonatype by following [this other guide][sonatype-guide]. Once this is done you will end with a Sonatype account, and your own group Id under which your projects can be released.

With all these repositories linked Bintray will automatically replicate them to JCenter, and while updating the project on Maven Central still requires a manual step it is much easier than the alternative.

### OSS Sonatype snapshots

After setting up the Sonatype account for Bintray you will also be able to release snapshots to the OSS Sonatype snapshots repository. The new project comes prepared to take care of this.

Remember that it may not be possible to add artifacts to OSS Sonatype until the project has at least one release on Maven Central.

## Maven site repository

While the new project will come ready to publish the Maven site, both for development and release version, there is no free service available for this. Instead a FTP should be prepared for it.

Just like with the artifacts repositories, it is not recommended changing the ids, as the scripts may stop working.

|ID|Repository|
|---|---|---|
|site|Releases documentation site repository|
|site-development|Development documentation site repository|

[github]: https://github.com/
[bintray]: https://bintray.com/
[sonatype]: https://oss.sonatype.org/

[travis-section]: ./travis.html
[deployment-section]: ./deployment.html
[deployment-scripts-section]: ./deployment.html#Scripts

[jcenter-guide]: https://bintray.com/docs/usermanual/uploads/uploads_includingyourpackagesinjcenter.html
[sonatype-guide]: http://blog.bintray.com/2014/02/11/bintray-as-pain-free-gateway-to-maven-central/

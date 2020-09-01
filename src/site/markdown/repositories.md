# Repositories

While it can be used be used just by itself, but to take full advantage of the new project some repositories should be prepared. Luckily most of them can be free and commonly used services, for which the project comes ready. The only exception is the documentation site, which will require some sort of static content server which the user should arrange by himself.

There are four repositories in total, and each is of a different kind: a SCM for the code, a releases repository, a snapshots one and a static content server for the Maven development and release sites.

Without them all it won't be possible to take advantage of the [deployment][deployment-section] feature, one of the most important capabilities which this archetype offers, or the [continuous integration][github-workflow-section] process, as both require them for working correctly.

If for some reason the actual services used need to be changed, all the information about the repositories is kept in the POM file, where it can be easily changed.

## SCM

The most important repository is the Source Code Manager, as this is where the code is stored and versioned. By default [GitHub][github] will be used.

### Automatic creation of the SCM URL

The repository's URL for the POM will be created by using the repoUserId and the project id Archetype variables:

```
https://www.github.com/${repoUserId}/${artifactId}
```

If the repository does not follow this naming pattern then the resulting URL should be corrected manually.

### Source Repository and Snapshots Versions

The [deployment scripts][deployment-scripts-section] included take advantage of the fact that Maven can now if the project is a release or a development version based on a suffix. If the version field on the POM ends with "-SNAPSHOT" then it is a snapshot, a development version. Otherwise it is a release.

For this reason the "-SNAPSHOT" prefix should be always used for the versions kept in all the development branches of the code repository.

## Artifact Repositories

Two repositories will be used for the code artifacts, one for releases and another for snapshots.

By default [Bintray][bintray] will be the one used for the releases, and [Sonatype OSS][sonatype] will be used for snapshots. Note that Sonatype requires additional configuration which is detailed in the guides below.

### Artifact Repositories Ids

Both repositories have a unique Id which are used mostly to find out the credentials to use for them during the deployment process.

For this same reason it is not recommended changing them, as some components may stop working.

|ID|Repository|
|---|---|
|releases|Release artifacts repository|
|snapshots|Snapshot artifacts repository|

### Mirroring to JCenter, OSS Sonatype and Maven Central

Using Bintray it is possible to link the releases repository to JCenter, Sonatype OSS and Maven central. This way most dependency managers, including the usual Maven configurations, will be able to acquire the project without adding any new repository info.

The process for achieving this is detailed in two guides:

The first step is required and consists on connecting the Bintray repository to JCenter. This is easy, just follow [this guide][jcenter-guide].

Then connect Bintray to OSS Sonatype by following [this other guide][sonatype-guide]. Once this is done you will end with a Sonatype account, and your own group Id under which your projects can be released.

With all these repositories linked Bintray will automatically replicate them to JCenter, and while updating the project on Maven Central still requires a manual step it is much easier than the alternative.

### OSS Sonatype Snapshots

After setting up the Sonatype account for Bintray you will also be able to release snapshots to the OSS Sonatype snapshots repository. The new project comes prepared to take care of this.

Remember that it may not be possible to add artifacts to OSS Sonatype until the project has at least one release on Maven Central.

## Maven Site Repository

As it is not a good idea using such features such as GitPages, because this make the SCM actually host two different projects, and there is no free static code repository around the user will have to provide his own. For example by setting up a FTP server.

### Site Repositories Ids

Just like with the artifacts repositories, it is not recommended changing these ids, as this may cause the scripts to stop working.

|ID|Repository|
|---|---|---|
|site|Releases documentation site repository|
|site-development|Development documentation site repository|

[github]: https://github.com/
[bintray]: https://bintray.com/
[sonatype]: https://oss.sonatype.org/

[github-workflow-section]: ./ghworkflow.html
[deployment-section]: ./deployment.html
[deployment-scripts-section]: ./deployment.html#Scripts

[jcenter-guide]: https://bintray.com/docs/usermanual/uploads/uploads_includingyourpackagesinjcenter.html
[sonatype-guide]: http://blog.bintray.com/2014/02/11/bintray-as-pain-free-gateway-to-maven-central/

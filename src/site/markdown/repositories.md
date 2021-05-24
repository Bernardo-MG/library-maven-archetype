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

Two profiles will be used for deployment. Each with its own repository. One is ready for [Sonatype OSS][sonatype] and another for [Github packages][github-packages].

## Maven Site Repository

As it is not a good idea using such features such as GitPages, because this make the SCM actually host two different projects, and there is no free static code repository around the user will have to provide his own. For example by setting up a FTP server.

### Site Repositories Ids

Just like with the artifacts repositories, it is not recommended changing these ids, as this may cause the scripts to stop working.

|ID|Repository|
|---|---|---|
|site|Releases documentation site repository|
|site-development|Development documentation site repository|

[github]: https://github.com/
[sonatype]: https://oss.sonatype.org/
[github-packages]: https://github.com/features/packages

[github-workflow-section]: ./ghworkflow.html
[deployment-section]: ./deployment.html
[deployment-scripts-section]: ./deployment.html#Scripts

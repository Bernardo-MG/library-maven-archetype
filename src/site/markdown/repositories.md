# Repositories

The new project will come ready to work with a set of repositories, all of them completely free.

For the project to work correctly it should be registered on each of the services mentioned in this page.

## SCM

The most important one is the Source Code Manager. This is the repository where the code is stored in a tree made up of the different versions of the project.

[GitHub][github] will be used for this, and the POM will be set up for this. Additionally, any reference to the SCM, such as the one on the readme, will be to the Github repository.

The default URL for it will be created by using the repoUserId Archetype variable and the project id. If the repository is not named just like the project then this should be corrected manually.

### Source repository and development versions

The deployment scripts included in the new project make use of a Maven feature for finding out if the project is a release or a development version. If the version field on the POM ends with "-SNAPSHOT" then it is a snapshot, a development version. Otherwise it is a release.

For this reason the "-SNAPSHOT" prefix should be always used for the versions kept in all the development branches of the code repository.

## Other repositories

Various other repositories are used to store all the products generated from the source code. This means the artifacts and the documentation, both for the release and development versions of the project.

They all have a unique Id, which will be used by Maven to work with them. For example, when deploying the project the credentials to each server will be referenced by this Id on the Maven settings file.

For this same reason it is not recommended editing them, as some components, such as the [deployment scripts][deployment-scripts-section], may stop working.

|ID|Repository|Default service|
|---|---|---|
|releases|Release artifacts repository|[Bintray][bintray]|
|snapshots|Snapshot artifacts repository|[Sonatype OSS][sonatype]|
|site|Releases documentation site repository|FTP|
|site-development|Development documentation site repository|FTP|

### Mirroring to JCenter, OSS Sonatype and Maven Central

Using Bintray it is possible to link the releases repository to JCenter, Sonatype OSS and Maven central. With this most dependency managers, including the usual Maven pre-defined configurations, will be able to acquire the project without adding any new repository info.

The process for achieving this is, mostly, very simple:

The first step is required and consists on connecting the Bintray repository to JCenter. This is easy, just follow [this guide][jcenter-guide].

Then connect Bintray to OSS Sonatype following [this other guide][sonatype-guide]. Once this is done you will end with a Sonatype account, and your own group Id under which your projects can be released.

With all these repositories linked Bintray will automatically replicate them to JCenter, and while updating the project on Maven Central still requires a manual step it is much easier than the alternative.

### OSS Sonatype snapshots

After setting up the Sonatype account for Bintray you will also be able to release snapshots to the OSS Sonatype snapshots repository. The new project comes prepared to take care of this.

Remember that it may not be possible to add artifacts to OSS Sonatype until the project has at least one release on Maven Central.

## Continuous integration

[Travis][travis] will be set as the project's CI service. This is commented in more detail in the [Travis section][travis-section].

The CI process will run tests after any change is made to the code, and will take care of binding the SCM with the other repositories, by taking care of the deployment process.

[github]: https://github.com/
[bintray]: https://bintray.com/
[sonatype]: https://oss.sonatype.org/
[travis]: https://travis-ci.org

[travis-section]: ./travis.html
[deployment-scripts-section]: ./deployment.html#Scripts

[jcenter-guide]: https://bintray.com/docs/usermanual/uploads/uploads_includingyourpackagesinjcenter.html
[sonatype-guide]: http://blog.bintray.com/2014/02/11/bintray-as-pain-free-gateway-to-maven-central/

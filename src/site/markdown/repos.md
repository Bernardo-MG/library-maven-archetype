# Repositories and services

The Archetype comes ready to work with free repositories. It's prepared to deploy to Bintray, for the releases, and Sonatype, for the snapshots, and will set up the project information to point to the GitHub repository.

The only piece missing a repository is the documentation, as I have been unable to find one, so for that a FTP server will be required.

Which means that the required repository services are:

- [GitHub](https://github.com/), for storing the code
- [Bintray](https://bintray.com/), for the code releases
- [Sonatype OSS](https://oss.sonatype.org/), for the snapshots
- Documentation FTP, to store the Maven sites for both the release and latest snapshot

 The way to set them all up goes beyond the scope of this manual, but it's usually a simple job, requiring little more than registering on a web page.

## Integrating the repositories

The repositories will be integrated with the use of [Travis](https://travis-ci.org), a free CI service. To find out more about how it is used check the [Travis section](./travis.html).

But in short, Travis will take care of building the code submitted to Github, sending the compiled artifacts to Bintray or Sonatype, and the documentation to the docs repository.

Just remember to connect Github and Travis together, which just required a free account and following [this guide](http://docs.travis-ci.com/user/getting-started/#To-get-started-with-Travis-CI%3A).

## JCenter, OSS Sonatype and Maven Central

Using Bintray, it is possible to link the releases depo to JCenter, OSS Sonatype and Maven central. Meaning that it won't be necessary to add any repository to the POM along the dependencies for being able to acquire the library as a dependency.

Connecting Bintray to JCenter is easy, just follow [this guide](https://bintray.com/docs/usermanual/uploads/uploads_includingyourpackagesinjcenter.html).

To connect Bintray to OSS Sonatype follow [this other guide](http://blog.bintray.com/2014/02/11/bintray-as-pain-free-gateway-to-maven-central/). Linking to Sonatype also means that the repository will be mirrored on Maven Central.

With all these repositories linked, any user will just have to check the usage page on the new library's Maven site to find out how to start using the project.

### OSS Sonatype snapshots

The Archetype comes prepared to release snapshots into the OSS Sonatype snapshots repository. This requires setting up a Sonatype account and adding the project there, something which is done if the previously linked guides have been followed.

That and checking the [deployment section](./deployment.html).

## Repository IDs

Inside the POM, a unique id has been given to each repository to be used for deployment:

|ID|Repository|
|---|---|
|releases|Release artifacts repository|
|snapshots|Snapshot artifacts repository|
|site|Releases documentation site repository|
|site-development|Development documentation site repository|

As these IDs are referenced in other places, such as the [deployment scripts](./deployment.html#Scripts), they should not be modified.

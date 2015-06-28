#set( $symbol_pound = '#' )
${symbol_pound} ${artifactName}

A basic Maven-based Java library created from the Library Maven Archetype.

While the archetype is meant to ease and simplify as much as possible creating a new Java library, it is still a good idea checking the results. Remember to verify, and change if needed, at least the following data:

- Links on the readme, POM and Maven site (repositories, issues, etc)
- Project info on the POM
- License, if not using the MIT one (POM, readme and LICENSE files)
- This readme description
- The documentation on the Maven site

Note that the Maven site will require the most work, as it is meant to be used for creating the library's documentation, and such it will require a few new pages describing it.

[![Maven Central](https://img.shields.io/maven-central/v/${groupId}/${artifactId}.svg)][maven-repo]
[![Bintray](https://api.bintray.com/packages/${repoUserId}/maven/${artifactId}/images/download.svg)][bintray-repo]

[![Release docs](https://img.shields.io/badge/docs-release-blue.svg)][site-release]
[![Development docs](https://img.shields.io/badge/docs-develop-blue.svg)][site-develop]

[![Release javadocs](https://img.shields.io/badge/javadocs-release-blue.svg)][javadoc-release]
[![Development javadocs](https://img.shields.io/badge/javadocs-develop-blue.svg)][javadoc-develop]

${symbol_pound}${symbol_pound} Features

Add a list of the project features here.

- A feature
- Another feature
- Yet another feature

${symbol_pound}${symbol_pound} Documentation

Documentation is always generated for the latest release, kept in the 'master' branch:

- The [latest release documentation page][site-release].
- The [the latest release Javadoc site][javadoc-release].

Documentation is also generated from the latest snapshot, taken from the 'develop' branch:

- The [the latest snapshot documentation page][site-develop].
- The [the latest snapshot Javadoc site][javadoc-develop].

The documentation site sources come along the source code (as it is a Maven site), so it is always possible to generate them using the following Maven command:

```
$ mvn site
```

${symbol_pound}${symbol_pound} Usage

The application is coded in Java, using Maven to manage the project.

${symbol_pound}${symbol_pound}${symbol_pound} Prerequisites

The project has been tested on the following Java versions:
* JDK 7
* JDK 8
* OpenJDK 7

All other dependencies are handled through Maven, and noted in the included POM file.

${symbol_pound}${symbol_pound}${symbol_pound} Installing

The recommended way to install the project is by setting up your preferred dependencies manager. To get the configuration information for this check the [Bintray repository][bintray-repo], or the [Maven Central Repository][maven-repo].

If for some reason manual installation is necessary, just use the following Maven command:

```
$ mvn install
```

${symbol_pound}${symbol_pound} Collaborate

Any kind of help with the project will be well received, and there are two main ways to give such help:

- Reporting errors and asking for extensions through the issues management
- or forking the repository and extending the project

${symbol_pound}${symbol_pound}${symbol_pound} Issues management

Issues are managed at the GitHub [project issues tracker][issues], where any Github user may report bugs or ask for new features.

${symbol_pound}${symbol_pound}${symbol_pound} Getting the code

If you wish to fork or modify the code, visit the [GitHub project page][scm], where the latest versions are always kept. Check the 'master' branch for the latest release, and the 'develop' for the current, and stable, development version.

${symbol_pound}${symbol_pound} License

The project has been released under the [MIT License][license].

[bintray-repo]: https://bintray.com/${repoUserId}/maven/${artifactId}/view
[maven-repo]: http://mvnrepository.com/artifact/${groupId}/${artifactId}
[issues]: https://github.com/${repoUserId}/${artifactId}/issues
[javadoc-develop]: http://${siteRelease}/development/maven/${artifactId}/apidocs
[javadoc-release]: http://${siteDevelop}/maven/${artifactId}/apidocs
[license]: http://www.opensource.org/licenses/mit-license.php
[scm]: https://github.com/${repoUserId}/${artifactId}
[site-develop]: http://${siteDevelop}/development/maven/${artifactId}
[site-release]: http://${siteRelease}/maven/${artifactId}

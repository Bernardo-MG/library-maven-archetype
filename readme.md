# Library Maven Archetype

A basic Maven Archetype to ease the creation of new Maven-based Java libraries.

It offers a quick way to create the bare bones for a project which includes documentation, testing (both unit and integration), segregating the deployment of development and releases based on the SCM branch, and making use of various integrated free services, such as Github, Travis and Bintray.

Remember to check the included default Maven site to learn how to start customizing this project.

[![Maven Central](https://img.shields.io/maven-central/v/com.wandrell.maven.archetypes/library.svg)][maven-repo]
[![Bintray](https://api.bintray.com/packages/bernardo-mg/maven/library-maven-archetype/images/download.svg)][bintray-repo]

[![Release docs](https://img.shields.io/badge/docs-release-blue.svg)][site-release]
[![Development docs](https://img.shields.io/badge/docs-develop-blue.svg)][site-develop]

## Features

- Creates a preconfigured project, allowing to begin developing the new library fast.
- Prepared for continuous integration, which differentiates between development and release artifacts and documentation.
- Unit and integration tests suites ready to be run with [TestNG][testng].
- A Maven site, using the [Docs Maven Skin][docs-skin], ready to show the project's documentation and several reports.
- Includes a basic readme template, along gitignore and gitattributes files.

## Example project

There is an [example project][example-project] showing what a new project created with the help of this Archetype looks like.

## Documentation

Documentation is always generated for the latest release, kept in the 'master' branch:

- The [latest release documentation page][site-release].

Documentation is also generated from the latest snapshot, taken from the 'develop' branch:

- The [the latest snapshot documentation page][site-develop].

The documentation site sources come along the source code (as it is a Maven site), so it is always possible to generate them using the following Maven command:

```
$ mvn verify site
```

The verify phase is required, as otherwise some of the reports won't be created.

## Usage

The application is coded in Java, using Maven to manage the project.

### Prerequisites

The project has been tested on the following Java versions:
* JDK 7
* JDK 8
* OpenJDK 7

All other dependencies are handled through Maven, and noted in the included POM file.

### Installing

The recommended way to install the archetype is by downloading it from the [Bintray repository][bintray-repo] (recommended), or the [Maven Central Repository][maven-repo]. For this use your preferred method and the following data:

```
Group ID: com.wandrell.maven.archetypes
Artifact ID: library-archetype
Version: (Check POM or badges)
URL: https://dl.bintray.com/bernardo-mg/maven/
```

For example, to use it through command line type the following:

```
$ mvn archetype:generate -DarchetypeGroupId=com.wandrell.maven.archetypes -DarchetypeArtifactId=library-archetype -DarchetypeVersion=0.2.2 -DarchetypeRepository=https://dl.bintray.com/bernardo-mg/maven/
```

Of course, it may also be added to the local repository through your preferred IDE, just by using that same information.

As an alternative, it is also possible to download the project from Github, and then install the project into the local archetypes repository using the following command:

```
$ mvn install
```

## Collaborate

Any kind of help with the project will be well received, and there are two main ways to give such help:

- Reporting errors and asking for extensions through the issues management
- or forking the repository and extending the project

### Issues management

Issues are managed at the GitHub [project issues tracker][issues], where any Github user may report bugs or ask for new features.

### Getting the code

If you wish to fork or modify the code, visit the [GitHub project page][scm], where the latest versions are always kept. Check the 'master' branch for the latest release, and the 'develop' for the current, and stable, development version.

## License
The project has been released under the [MIT License][license].

[bintray-repo]: https://bintray.com/bernardo-mg/maven/com.wandrell.maven.archetypes/view
[docs-skin]: https://github.com/Bernardo-MG/docs-maven-skin
[example-project]: https://github.com/Bernardo-MG/library-maven-archetype-example
[maven-repo]: http://mvnrepository.com/artifact/com.wandrell.archetype/library
[testng]: http://testng.org
[issues]: https://github.com/Bernardo-MG/library-maven-archetype/issues
[license]: http://www.opensource.org/licenses/mit-license.php
[scm]: http://github.com/Bernardo-MG/library-maven-archetype
[site-develop]: http://docs.wandrell.com/development/maven/library-maven-archetype
[site-release]: http://docs.wandrell.com/maven/library-maven-archetype

# Basic Maven Project
A basic Maven project created from the Basic Maven Archetype.

This should be set up correctly before use. Remember to change at least the following data:

- Links on the readme
- Links on the POM (repositories, issues, etc)
- License, if not using the MIT one (POM, readme and LICENSE file)
- This readme description

## Documentation
Documentation is always generated for the latest release:

- The [latest release documentation page][site-release].
- The [the latest release Javadoc site][javadoc-release].

Documentation is also generated from the latest snapshot, taken from the 'develop' branch:

- The [the latest snapshot documentation page][site-develop].
- The [the latest snapshot Javadoc site][javadoc-develop].

The site sources come along the source code, so it is always possible to generate them using the Maven site command.

## Building the code
The application is coded in Java, using Maven to handle the project's configuration and tests.

### Prerequisites
The project has been tested on the following Java versions:
* JDK 7
* JDK 8
* OpenJDK 7

All other dependencies are handled through Maven, and noted in the included POM file.

## Collaborate

The project is still under ongoing development, and any help will be well received.

There are two ways to help: reporting errors and asking for extensions through the issues management, or forking the repository and extending the project.

### Issues management
Issues are managed at the GitHub [project issues page][issues].

Everybody is allowed to report bugs or ask for features.

### Getting the code
The code can be found at the [GitHub project page][scm].

Feel free to fork it, and share the changes.

## License
The project is released under the [MIT License][license].

[issues]: https://github.com/${repoUserId}/${repoProjectId}/issues
[javadoc-develop]: ${siteReleasePublic}/maven/${repoProjectId}/apidocs
[javadoc-release]: ${siteDevelopPublic}/maven/${repoProjectId}/apidocs
[license]: http://www.opensource.org/licenses/mit-license.php
[scm]: https://github.com/${repoUserId}/${repoProjectId}
[site-develop]: ${siteDevelopPublic}/maven/${repoProjectId}
[site-release]: ${siteReleasePublic}/maven/${repoProjectId}

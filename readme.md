# Library Maven Archetype
A basic Maven archetype to ease the creation of new Maven library projects.

It has not been created to fit any specific set of requirements beyond my personal tastes. Still, it is meant to be reusable, and offers several useful features:

- Unit and integration tests suits ready to be run with TestNG.
- Travis is used to publish code and documentation artifacts.
- A Maven site, using the reflow skin, can be created to show documentation and reports.
- Includes a basic readme template and a gitignore file.

## Documentation
Documentation is always generated for the latest release:

- The [latest release documentation page][site-release].

Documentation is also generated from the latest snapshot, taken from the 'develop' branch:

- The [the latest snapshot documentation page][site-develop].

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

[issues]: https://github.com/Bernardo-MG/library-maven-archetype/issues
[license]: http://www.opensource.org/licenses/mit-license.php
[scm]: http://github.com/Bernardo-MG/library-maven-archetype
[site-develop]: http://docs.wandrell.com/development/maven/library-maven-archetype
[site-release]: http://docs.wandrell.com/maven/library-maven-archetype

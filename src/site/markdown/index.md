# An Archetype for Libraries

Archetypes act as templates for new Maven projects, taking care of the most tedious and repetitive tasks for the user, who can just begin coding a pre-configured project.

In this case this Archetype creates a generic Maven-based library which includes various common and useful plugins and utilities, and also comes ready for a full development cycle including CI, where each change to the code is checked before performing automatic releases.

## Features

- [Wandrell's Base POM][base-pom] used as parent POM.
- [Unit and integration test][tests] suites are run separatedly with the use of [TestNG][testng].
- [Maven site for the project][site], using the [Docs Maven Skin][docs-skin], for creating a small documentation site.
- [Javadocs][site-javadoc] included in the Maven site.
- [Several useful reports][site-reports] added to the Maven site.
- [Changes log][changes] added to the Maven site.
- [Ready to make use of Travis CI][travis] for testing and deployment.
- [Deployment][deployment] covers both artifacts and documentation site.
- [Deployment scripts][deployment-scripts] making a distinction between release and development versions.
- The artifact manifest is fully configured.
- A basic readme template.
- .gitignore and .gitattributes files prepared for common uses.
- [MIT License][license].

## Example project

For a quick taste, there is an [example project][example-project] showing what can be created with the use of this Archetype.

## Commands for the new project

From the first moment the a new project is created all the usual Maven commands can be used, some of these are:

|Command|Usage|
|---|---|
|$ mvn clean package|Creating the jar file|
|$ mvn clean install|Installing the project to the local repository|
|$ mvn clean unit|Running only unit tests|
|$ mvn clean verify|Running unit and integration tests|
|$ mvn clean verify site|Generating the Maven site and all the report|


[base-pom]: https://github.com/Bernardo-MG/base-pom
[docs-skin]: https://github.com/Bernardo-MG/docs-maven-skin
[example-project]: https://github.com/Bernardo-MG/library-maven-archetype-example

[testng]: http://testng.org/

[license]: ./license.html

[deployment]: ./deployment.html
[deployment-scripts]: ./deployment.html#scripts
[changes]: ./changes.html
[site]: ./site.html
[site-javadoc]: ./site.html#javadocs
[site-reports]: ./site.html#reports
[tests]: ./tests.html
[travis]: ./travis.html

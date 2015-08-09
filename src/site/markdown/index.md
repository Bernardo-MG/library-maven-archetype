# An Archetype for Libraries

Archetypes act as templates for new Maven projects, defining the initial configuration, along a collection of starting folders and files tailored for a specific need.

In this case it is a generic setup, meant to ease the creation of Maven-based Java libraries and encourage good practices, such as unit/integration testing and continuous integration.

## Features

Among all the features offered by the project the most important are:

- [Unit and integration tests][tests] ready to be run, independently from each other, with TestNG.
- [Maven site for the project][site], using the [Docs Maven Skin][docs-skin], to be used as a documentation site.
- [Several useful reports][site] added to the Maven site.
- [Ready to make use of Travis CI][travis] for testing and deployment.
- [Deployment scripts][deployment] making a distinction between release and development versions.
- [Deployment includes artifacts and documentation][deployment] site.
- A basic readme template.
- .gitignore and .gitattributes files prepared for common uses.
- MIT License.

## Example project

There is an [example project][example-project] showing what a new project created with the help of this Archetype looks like.

[docs-skin]: https://github.com/Bernardo-MG/docs-maven-skin
[example-project]: https://github.com/Bernardo-MG/library-maven-archetype-example

[deployment]: ./deployment.html
[site]: ./site.html
[tests]: ./tests.html
[travis]: ./travis.html
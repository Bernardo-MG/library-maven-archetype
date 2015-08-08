# Maven-Based Java Library

This is a base project created with the [Library Maven Archetype][library-archetype], prepared to build a Maven-based Java library.

Note that while it is meant to be working from the beginning, and with working it means "compiles, runs the tests and creates the docs", it is mostly composed of placeholders which should be swapped with actual content.

---

# Where should I start customizing the project?

First of all, check the [Library Maven Archetype][library-archetype] documentation, and then edit the readme file and the Maven site, so they talk about this project.

After that, of course, the classes and tests included should be replaced with the actual code which the library will offer.

# Some external requirements

To correctly use this template, some additional things have to be set up. These are a few services which are expected to be used by the project, which comes prepared for them:

- Version control system, Github by default.
- Continuous integration, Travis CI by default.
- Releases repository, Bintray by default.
- Test artifacts repository, Sonatype OSS by default.
- Documentation repository, a FTP by default.

[library-archetype]: https://github.com/Bernardo-MG/library-maven-archetype
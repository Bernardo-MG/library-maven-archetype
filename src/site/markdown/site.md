# Site

The archetype is configured to create a Maven site, similar to this one, containing all the documentation, and several reports.

This site will be the one deployed as the documentation by the CI, and so it will be a part of the project's life cycle.

Note that it will be for the most part a normal Maven site, meaning that information about how to customize it can be found at the official Maven site, with the main difference being that it will use the [Reflow](http://github.com/andriusvelykis/reflow-maven-skin) skin.

## Site files

The files used to create the site are on the 'src/site' folder. It contains a 'site.xml' file indicating the structure of the page, and several markdown files, each used to build a single page.

Note that the index file is called 'index.md.vm'. This marks the file to be processed by Velocity, which will swap all the variables it finds inside with those from the POM. If you are going to use this feature, remember that velocity won't work with variables containing points.

## Reports

The reports generation plugins mean that the project does not depend on external services to evaluate the code. These reports handle common things such as code quality or test coverage, and a few additional features like the changes list.

By default, the following reports are added to the site:

- [Changes](https://maven.apache.org/plugins/maven-changes-plugin/)
- [Tag list](http://www.mojohaus.org)
- [Checkstyle](https://maven.apache.org/plugins/maven-checkstyle-plugin/)
- [FindBugs](http://gleclaire.github.io/findbugs-maven-plugin/)
- [PMD](http://maven.apache.org/plugins/maven-pmd-plugin/)
- [Surefire](https://maven.apache.org/surefire/maven-surefire-plugin/)
- [Failsafe](https://maven.apache.org/surefire/maven-failsafe-plugin/)
- [JaCoCo](http://www.eclemma.org/jacoco/trunk/doc/maven.html)
- [JDepend](mojo.codehaus.org/jdepend-maven-plugin)

### Configuration changes to reports

The archetype contains configuration files for PMD and Checkstyle, meant to reduce the noise of those reports.

### Changes plugin configuration

The changes file is stored on the 'src/changes' folder. It is the 'changes.xml' file, and should be updated with all the changes made during version changes.

More information about this file can be found at the [changes.xml specification](https://maven.apache.org/plugins/maven-changes-plugin/changes.html).

## Creating the site

To correctly generate all the reports, the site requires the testing results. For this reason, the recommended way to generate the site is using the following command:

```
mvn verify site
```

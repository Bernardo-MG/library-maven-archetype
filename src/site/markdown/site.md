# Site

The Archetype comes ready to create a [Maven site][maven-site], similar to this one. This is an easy way to share the project's documentation, along the Javadocs and several reports showing its status.

## Creating the site

Using the default command for generating the Maven site is not recommended. This is because it won't run the integration tests, meaning that the tests reports won't show any information about them.

Instead the following command should be used to get the full reports:

```sh
$ mvn verify site
```

## Javadocs

Apart from the reports mentioned below, the site will generate and include the Javadocs for the project, which will be accessible in the same section as the reports.

## Reports

Maven, thanks to several plugins, allow generating a full array of tests which otherwise would require from external services or applications. The results from their analysis are reported in the Maven site, and they cover common things such as code quality or test coverage, but also add a few additional features like the changes list.

The following reports come included in the new project and will be added to the site:

- [Changes](https://maven.apache.org/plugins/maven-changes-plugin/)
- [Tag list](http://www.mojohaus.org)
- [Checkstyle](https://maven.apache.org/plugins/maven-checkstyle-plugin/)
- [FindBugs](http://gleclaire.github.io/findbugs-maven-plugin/)
- [PMD](http://maven.apache.org/plugins/maven-pmd-plugin/)
- [Surefire](https://maven.apache.org/surefire/maven-surefire-plugin/)
- [Failsafe](https://maven.apache.org/surefire/maven-failsafe-plugin/)
- [JaCoCo](http://www.eclemma.org/jacoco/trunk/doc/maven.html)
- [JDepend](mojo.codehaus.org/jdepend-maven-plugin)

Reports are shown in the reports page, but this is not generated dynamically. If any new reporting plugin is added then the *src/site/markdown/reports.md* should be edited.

### Customized reports

The archetype contains modified configuration files for PMD and Checkstyle, meant to check the project in deep searching for various style errors.

These files can be found in the *src/config* folder.

### Changes report

The Changes plugin allows creating a changes log for each version of the project. More information about this can be found in the [changes log][changes] section.

[changes]: ./changes.html
[maven-site]: http://maven.apache.org/guides/mini/guide-site.html

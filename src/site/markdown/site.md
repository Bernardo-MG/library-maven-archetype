# Site

The Archetype comes ready to create a [Maven site][maven-site], similar to this one. This is an easy way to share the project's documentation, along the Javadocs and several reports showing its status.

## Creating the site

Using the default command for generating the Maven site is not recommended. This is because it won't run the integration tests, meaning that the tests reports won't show any information about them.

Instead the following command should be used to get the full reports:

```sh
$ mvn verify site
```

## Javadocs

Building the site will generate and include the Javadocs for the project, which will be accessible from the *info and reports* menu.

This menu includes a link to the folder where Maven stores the generated javadocs, the *apidocs* folder.

## Reports

The [bernardomg's Base POM][base-pom], being used as the parent POM, already configures several reports. To these the following are added:

- [Changes](https://maven.apache.org/plugins/maven-changes-plugin/)

Reports are shown in the reports page, but this is not generated dynamically. If any new reporting plugin is added then the *src/site/markdown/reports.md* should be edited.

### Customized reports

The archetype contains modified configuration files for PMD and Checkstyle, meant to check the project in deep searching for various style errors.

These files can be found in the *src/config* folder.

### Changes report

The Changes plugin allows creating a changes log for each version of the project. More information about this can be found in the [changes log][changes] section.

## The skin

The site is prepared to use the [Docs Maven Skin][docs-maven-skin]. The most important information about its usage can be found on the skin project's site, but a few things should be commented.

### Repositories info

The footer of the Maven Site will contain a link for Maven Central and another for Bintray. These are the URLs for the project in each of these releases repositories.

These links are set in the *site.xml* file, in the *releaseRepositories* node, but they read the actual links from the properties in the POM, to keep all the configuration together. If new repositories are added, or any of these not used, this information should be edited.

[changes]: ./changes.html
[maven-site]: http://maven.apache.org/guides/mini/guide-site.html

[base-pom]: https://github.com/Bernardo-MG/base-pom

[docs-maven-skin]: https://github.com/Bernardo-MG/docs-maven-skin

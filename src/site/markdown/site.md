# Site

The archetype is configured to create a Maven site, similar to this one, containing all the documentation, and several reports.

This site will be the one deployed as the documentation by the CI, and so it will be a part of the project's life cycle.

Note that it will be for the most part a normal Maven site, meaning that information about how to customize it can be found at the official Maven site, with the main difference being that it will use the [Reflow](http://github.com/andriusvelykis/reflow-maven-skin) skin.

## Reports

By default, the following reports are added to the site:

- Changes
- Tag list
- Checkstyle
- FindBugs
- PMD
- Failsafe
- Surefire
- JaCoCo
- JDepend

### Configuration changes to reports

The archetype contains configuration files for PMD and Checkstyle, meant to reduce the noise of those reports.
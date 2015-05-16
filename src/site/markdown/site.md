# Site

The archetype is configured to create a Maven site, similar to this one, containing all the documentation, and several reports.

This site will be the one deployed as the documentation by the CI, so it will be a part of the project's life cycle.

The Reflow skin is used for it.

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

The archetype contains configuration files for PMD and checkstyle, meant to reduce the noise of those reports.
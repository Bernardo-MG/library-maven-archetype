# Changes log

The new project comes ready to show a changes log detailing the project evolution from version to version.

This is done with the use of the [Changes plugin][changes], and the log file found in the *src/changes/changes.xml* path, which should be updated with each new version to reflect the main changes.

More information about this file can be found at the [changes.xml specification][changes-spec].

## Changes file validation

Before creating the changes report the plugin verifies that the file is correct. If the check does not pass then the build will be stopped.

[changes]: https://maven.apache.org/plugins/maven-changes-plugin/
[changes-spec]: https://maven.apache.org/plugins/maven-changes-plugin/changes.html
# Build validation

The new project will try to validate the project before building it, and stop the procedure if it fails to do so. This validation is meant to serve for ensuring the project is correctly configured, and will work in addition to the validation which Maven already does.

## Enforcer

Several rules from the [Maven Enforcer Plugin][enforcer-plugin] will be used to verify that the POM is correctly configured.

### Dependencies convergence

Dependency convergence just means that when several versions of a same dependency appear only one of them should be used.

Maven already does this by default, taking only the first version found, which is error prone. The alternative is excluding all the unwanted versions, but this is not only error prone too, it is also tedious.

While the basic convergence rule enforces excluding all the conflicts, the more lenient *requireUpperBoundDeps* rule only requires ensuring that the version actually used by Maven is the latest.

With this fixing dependency convergence conflicts just requires adding the latest version of the library to the POM.

###  Required Java version

Only current Java versions are accepted when building the project. Meaning that if the project is compiled by using one version older than Java 1.7 it will fail.

### Plugin versions

This rule requires that all the plugins set in the POM should have a version defined for them.

### Required properties

The following properties are required to be set as part of the POM properties:

#### Maven defaults

These are used by Maven to define various default values, and will be used to configure plugins.

|Property|Usage|
|---|---|
|project.build.sourceEncoding|Encoding for the source|
|project.build.outputEncoding|Encoding for the outputs|
|maven.compiler.source|Source JDK version|
|maven.compiler.target|Target JDK version|

#### Manifest

|Property|Usage|
|---|---|
|manifest.name|Name for the manifest|

## Additional verifications

Some of the [reports][reports] included in the generated Maven site will indicate possible problems to fix and correct. 

While a few of these problems can be important, and probably should be fixed before any release, the plugins are not set to stop the build when they are found. Still, if needed the plugins can be set up to ensure all these verifications pass, and stop the build if they don't.

### Changes report

The changes report will stop the building if the date or version are invalid. This means just that they should be coherent, so a new update can't happen before the latest, for example.

[enforcer-plugin]: https://maven.apache.org/enforcer/maven-enforcer-plugin/

[reports]: ./site.html#reports

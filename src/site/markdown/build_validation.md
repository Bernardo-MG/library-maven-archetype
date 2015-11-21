# Build validation

The new project will come ready to validate any attempt to build it. These are just some basic validation rules to make sure it is correctly configured, and will be added to the usual checks Maven runs through.

## Enforcer

Several rules from the [Maven Enforcer Plugin][enforcer-plugin] will be used to verify that the POM is correctly configured.

### Dependencies convergence

Dependency convergence just means that when several versions of a same dependency appear only one of them should be used.

Maven already does this by default, taking only the first found version. But this is error prone, and the alternative, excluding all the unwanted versions, is tedious to mantain.

For this reason the *requireUpperBoundDeps* rule is used for ensuring the dependencies convergence. With it any convergence issues is solved by adding the latest version of the dependency to the POM, instead of removing the conflicting ones.

###  Required Java version

Only current Java versions are accepted when building the project. Meaning that if the project is compiled by using one version older than Java 1.7 it will fail.

### Plugin versions

This rule requires that all the plugins set in the POM should have a version defined for them.

### Required properties

The following properties are required to be set as part of the POM properties.

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

While some of these problems can be important, and probably should be fixed before any release, the plugins are not set to stop the build when they are found. Still, if needed the plugins can be set up to ensure all these verifications pass, and stop the build if they don't.

[enforcer-plugin]: https://maven.apache.org/enforcer/maven-enforcer-plugin/

[reports]: ./site.html#reports

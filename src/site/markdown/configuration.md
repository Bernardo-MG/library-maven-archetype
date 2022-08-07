# Additional Configuration

## Changing JDK Version

Maven configuration is inherited from the [Base POM][base_pom], which includes the JDK definition.

By default the project will be set for JDK 11. If this needs to be changed, for example to make use of JDK 17, the java.version property has to be overriden:

```xml
<properties>
   <java.version>17</java.version>
<\properties>
```

This will be used to override both the project.build.sourceEncoding and the project.reporting.outputEncoding properties.

Remember to update the Github Workflow files to change the JDK being used.

[base_pom]: https://github.com/Bernardo-MG/base-pom
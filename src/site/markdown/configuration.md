# Additional Configuration

## Changing JDK Version

Maven configuration is inherited from the [Base POM][base_pom], which includes the JDK definition.

By default the project will support JDK 7. To change this, for example for a JDK 8 project, just change the java.version property:

```xml
<properties>
   <java.version>1.8</java.version>
<\properties>
```

This will be used to override both the project.build.sourceEncoding and the project.reporting.outputEncoding properties.

Remember to update the Travis file to remove the JDK 7 builds.

[base_pom]: https://github.com/Bernardo-MG/base-pom
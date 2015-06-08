# Setting up the dependencies

The project files are hosted on [Bintray][bintray], and have been replicated on JCenter and OSS Sonatype, which also replicates it into the Maven Central Repository.

This means that it should not be necessary to set up the repository data, and the dependency should be accessible by default.

Still, if any problem were to arise, the Bintray repo should be treated as the main repository.

Both the repository data and the dependency can be added with the following lines:

---

## Maven

### Dependency

To add the dependency:

```
<dependencies>
	...
	<dependency>
		<groupId>${groupId}</groupId>
		<artifactId>${artifactId}</artifactId>
		<version>${${groupId}.${artifactId}.version}</version>
	</dependency>
	...
</dependencies>
```

It is recommended to set the version through a property, as shown in the example.

### Repo info

To add the Bintray repository to Maven (should not be required) just add the following to the POM:

```
<repositories>
	...
	<repository>
		<snapshots>
			<enabled>false</enabled>
		</snapshots>
		<id>bintray-${repoUserId}-maven</id>
		<name>bintray</name>
		<url>http://dl.bintray.com/${repoUserId}/maven</url>
	</repository>
	...
</repositories>
```

## Gradle

### Dependency

To add the dependency:

```
dependencies {
	compile(group: '${groupId}', name: '${artifactId}', version: 'x.y.z')
}
```

Of course, the 'x.y.z' version should be set to the current one for the project.

### Repository

To add the Bintray repository to Gradle (should not be required) just add the following to the config file:

```
repositories {
    maven {
        url  "http://dl.bintray.com/${repoUserId}/maven" 
    }
}
```

---

# Artifacts

Artifacts are stored on OSS Sonatype. They can be accessed by adding the following lines to the configuration files:

## Maven

```
<repositories>
	...
	<repository>
		<id>oss-sonatype-snapshots</id>
		<name>OSS Sonatype snapshots repository</name>
		<url>https://oss.sonatype.org/content/groups/staging</url>
	</repository>
	...
</repositories>
```

[bintray]: https://bintray.com/${repoUserId}/maven/${artifactId}/view}Bintray
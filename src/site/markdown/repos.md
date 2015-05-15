# Repositories

Four repositories are required by the archetype, two for the documentation, and two for the compiled code. The reason for the pairs is that one repository of each is for the releases, and the other for the development versions.

To find out more about this check the Travis integration section.

## Repository IDs

The repositories handled by Maven are defined on the POM with the following IDs:

|ID|Repository|
|---|---|
|releases|Release artifacts repository|
|snapshots|Snapshot artifacts repository|
|site|Releases documentation site repository|
|site-development|Development documentation site repository|

The process of uploading new files to them will be handled by the CI system. Check the Travis section for more information.

## Documentation

The documentation repositories store a Maven site for the project, similar to this one, which will also include the Javadocs.

## Upload method

Files are uploaded through FTP, using Wagon.
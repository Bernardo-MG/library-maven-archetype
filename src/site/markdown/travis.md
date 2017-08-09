# Travis Integration

New projects come ready to make use of [Travis CI][travis], which will handle both the testing and the deployment tasks for the project.

Of course, deployment is taken with care and jobs for both release and develop versions are independent from each other. This is detailed below, but basically changes to the *main* branch of the SCM will trigger the deployment of release artifacts, while changes to the *develop* branch will trigger the deployment of snapshots. Any other branch won't trigger any kind of deployment.

For this to work the [repositories][repositories] used by the project should be correctly prepared and working.

## Connecting the SCM to Travis

The Archetype will set up the project to work with [Github][github]. This SCM is very easy to connect to Travis by just following the [beginners guide][travis-guide].

It may not be possible using Travis with other repositories. Check their manual site to find out more.

## Configuration file

Travis requires a .travis.yml file, included in the project's root folder, which will be used to configure the CI process. Again, more information about this can be found in the [beginners guide][travis-guide], but a few things should be commented.

### JDK versions

The file comes ready to test the project using the JDK 7, JDK 8 and openJDK 7. If any of these are not supported they should be removed, and the file adapted to it.

Also the JDK 7 will be used to deploy the code artifacts, while JDK 8 will be used for the Maven site. This way the code is compatible with both the JDK 7 and 8, and the Javadoc generated along the Maven site takes advantage of the latest Javadoc doclet.

### Scripts

The Travis configuration file will call a script for each deployment, and these are detailed in the [deployment section][deployment].

## Environmental variables

Various environmental variables, defined in the [deployment section][deployment], should be set up correctly for making the Travis integration tasks work.

While most of these should be set as part of the Travis environmental variables, some are already taken care of by the configuration file.

### Deployment flags

The deployment flags are taken care of in the Travis configuration file. These are the following environmental variables:

- DEPLOY
- DEPLOY\_DOCS

## Deployment configuration

As commented before the Travis configuration file takes care of deciding which JDK version creates the artifacts or documentation. This is done through the [deployment flags][deployment-variables]. As commented before, by default these will be set for deploying the artifact using Java 7 and the Maven site using Java 8.

If this has to be changed just modify the Travis configuration matrix.

For example, to deploy both using Java 8 use the following matrix:

```
matrix:
  include:
    - jdk: oraclejdk8
      env: DEPLOY=true
    - jdk: oraclejdk8
      env: DEPLOY_DOCS=true
```

[github]: https://github.com/

[travis]: https://travis-ci.org
[travis-guide]: http://docs.travis-ci.com/user/for-beginners/

[repositories]: ./repositories.html
[deployment]: ./deployment.html
[deployment-variables]: ./deployment.html#deploymentflags
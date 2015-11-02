# Travis Integration

New projects come ready for making use of [Travis CI][travis], which will take care of both the testing and the deployment tasks each time any change is pushed to the code repository.

Of course deployment is taken with care, and segregated into releases and snapshots. This is detailed below, but basically changes to the 'main' branch will trigger the release deployment, while changes to the 'develop' branch will trigger the snapshot deployment. Any other branch won't trigger any kind of deployment.

## Environmental variables

The repository access data variables, defined in the [Deployment](./deployment.html) section, should be set up correctly for making the Travis integration tasks work.

### Adapting Travis variables

The required variables are not the same as the Travis environmental variables, but the second set includes all the required info for the first.

This is solved by mapping them, which is done in the '.travis.yml' file.

The mapping is as follows:

|Travis variable|Deployment variable|
|---|---|
|TRAVIS\_PULL\_REQUEST|PULL\_REQUEST|
|TRAVIS\_BRANCH|SCM\_BRANCH|

### Deployment flags

The '.travis.yml' file will set up the deployment flags when required. By default these will be set for deploying the artifact using Java 7 and the docs using Java 8.

If this has to be changed just modify the Travis configuration matrix.

For example, to deploy both using Java 8 use the following matrix:

```
matrix:
  exclude:
    - jdk: oraclejdk8
  include:
    - jdk: oraclejdk8
      env: DEPLOY=true DEPLOY_DOCS=false PULL_REQUEST=$TRAVIS_PULL_REQUEST SCM_BRANCH=$TRAVIS_BRANCH
    - jdk: oraclejdk8
      env: DEPLOY=false DEPLOY_DOCS=true PULL_REQUEST=$TRAVIS_PULL_REQUEST SCM_BRANCH=$TRAVIS_BRANCH
```

[travis]: http://docs.travis-ci.com
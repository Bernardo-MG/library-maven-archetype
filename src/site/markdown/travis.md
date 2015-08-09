# Travis Integration

The archetype comes ready for [Travis CI][travis], which will take care of both the testing and the deployment tasks.

## Environmental variables

The repository access data variables, defined in the [Deployment](./deployment.html) section, should be correctly configured for making the Travis integration work.

### Adapting Travis variables

The .travis.yml file will adapt some of Travis environmental variables to those required by the scripts:

|Travis variable|Transformed into|
|---|---|
|TRAVIS\_PULL\_REQUEST|PULL\_REQUEST|
|TRAVIS\_BRANCH|SCM\_BRANCH|

### Deployment flags

The .travis.yml will set up the deployment flags, which by default will deploy the artifact using Java 7 and the docs using Java 8. To change this just modify the configuration matrix.

[travis]: http://docs.travis-ci.com
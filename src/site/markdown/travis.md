# Travis Integration

The archetype comes ready to integrate with Travis CI, which will take care of both the testing and the deployment tasks.

Of course, for this to work first you must have set up Travis and connected it to a code repository. For this check the [Travis guide][travis-guide].

## Environmental variables

The repository access data variables, defined in the [Deployment](./deployment.html) section, should be correctly configured for making the Travis integration work.

## Travis configuration file

The .travis.yml file is prepared to run the tests and the deployment scripts.

Additionally it will handle the [deployment flags](./deployment.html#Deployment_flags), which by default will deploy the artifact using Java 7 and the docs using Java 8. To change this just modify the configuration matrix.

[travis-guide]: http://docs.travis-ci.com/user/for-beginners/
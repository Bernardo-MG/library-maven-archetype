# Tests

The Archetype comes prepared for running both unit and integration tests. These should be kept in two separated packages in the test classpath, allowing two different plugins to run each of the suites easily.

These plugins used will be [Surefire][surefire], to run unit tests, and [Failsafe][failsafe] for the integration ones.

## Testing framework

[TestNG][testng] comes included as the testing framework, as a dependency with the *test* scope.

While there have been several reasons for picking this against JUnit (mainly, having some capabilities which were needed in some other projects), the only feature the new project makes use of are the XML test suites, which will be used to locate the unit and integration tests.

## Tests structure

Unit and integration tests should be stored in different class paths, making it easier to differentiate them, as reflected by the placeholder tests created with the project.

The *test/resources* folder includes two TestNG suites as XML files, one for each type of test. The *tests\_maven\_unit\_suite.xml* will run all of the unit tests, and the *tests\_maven\_integration\_suite.xml* will run all the integration ones.

### Naming the tests

While not required, it is recommended to start the name of unit test classes with the *Test* keyword, and the integration test classes with the *IT* keyword.

It is mostly for making the tests type easier to recognize, but there are some useful side-effects to this. For example if the testing framework is changed to JUnit, this will stop integration tests from being accidentally run as unit tests

### Tests classpath

It may seem strange that the classpath for the tests on the new project has *testing.test* as part of it. The reason is that if additional classes are required for the tests they should be added into a *testing.util*, or similar, package. Keeping the actual tests separated from any helper class.

## Reports

Reports are generated on the Maven Site for both unit and integration tests, and this is done by the Surefire and Failsafe plugins, the same ones which take care of running the tests. 

A coverage report, created with [JaCoCo][jacoco], is also generated.

## Logging

Testing requires Log4J for logging, and this is included as a dependency with the *test* scope.

The configuration file, named *log4j2-test.xml*, can be found on the tests resources folder, and is prepared to generate a log file when running the tests.

## Running the tests

The common way to run tests through Maven is:

```sh
$ mvn test
```

But that will only run the unit tests.

For the integration ones the *verify* goal is required, which will run them after the unit ones. For this reason, to run the full test suites the following command should be used:

```sh
$ mvn verify
```

[surefire]: https://maven.apache.org/surefire/maven-surefire-plugin/
[failsafe]: https://maven.apache.org/surefire/maven-failsafe-plugin/
[jacoco]: http://eclemma.org/jacoco/trunk/doc/maven.html

[testng]: http://testng.org
# Tests

The Archetype will prepare the project for running both unit and integration tests. These should be kept in two separated packages in the test classpath, allowing two different plugins to run each of the suites easily.

These plugins used will be [Surefire][surefire], to run unit tests, and [Failsafe][failsafe] for the integration ones.

## Unit test, integration tests and Maven goals

While there are several guides and discussions about what are unit tests and what integration tests, what is of importance here is knowing that for Maven the distinction is very clear. The unit tests are run on the *test* goal, while the integration ones are run in the *verify* goal.

Most of the time only the *test* goal is run, for example when creating the site. But a complete run of the Maven lifecycle, such as when the jar is created, will run also the *verify* goal.

This allows using the unit tests to be run always, while the integration test will be run only when required. Now what kind of test actually goes into each section will depend on the user.

## Testing framework

[TestNG][testng] comes included as the testing framework, as a dependency with the *test* scope.

While there have been several reasons for picking this against [JUnit][junit] (mainly, having some capabilities which were needed in some other projects), the only feature the new project makes use of are the XML test suites, which will be used to locate the unit and integration tests.

## Tests structure

Unit and integration tests should be stored in different class paths, so they are easier to differentiate. This is reflected by the placeholder tests created with the project.

The *test/resources* folder includes two TestNG suites as XML files, one for each type of test. The *tests\_maven\_unit\_suite.xml* will be run with the *test* goal and is for the unit tests, and the *tests\_maven\_integration\_suite.xml* will be run with the *verify* one and is for the integration tests.

### Naming the tests

While not required, it is recommended to start the name of each unit test class with the *Test* keyword, and the integration test classes with the *IT* keyword.

This is mostly for making the tests type easier to recognize, but there are some useful side-effects to this. For example if the testing framework is changed to JUnit, this will stop integration tests from being accidentally run as unit tests.

### Tests classpath

It may seem strange that the classpath for the tests on the new project includes *testing.test* as part of it. The reason is that if additional classes are required for the tests they should be added into a *testing.util*, or similar, package. Keeping the actual tests separated from any helper class.

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

If the integration need to be run then the *verify* goal is required. This will run them after the unit ones.

For this reason, to run the full test suites the following command should be used:

```sh
$ mvn verify
```

[surefire]: https://maven.apache.org/surefire/maven-surefire-plugin/
[failsafe]: https://maven.apache.org/surefire/maven-failsafe-plugin/
[jacoco]: http://eclemma.org/jacoco/trunk/doc/maven.html

[junit]: http://junit.org/
[testng]: http://testng.org
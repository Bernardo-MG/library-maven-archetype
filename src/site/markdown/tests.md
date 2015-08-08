# Tests

The Archetype comes prepared for running both unit and integration tests. They will be kept separated, on two different class paths, with two different tests suites, and run by two different plugins.

Surefire will be used to run unit tests, while Failsafe will take care of integration ones.

## Tests framework

TestNG is meant to be used as the tests framework, and is included through the 'test' scope.

There are several reasons for picking this against JUnit, mostly that it easily allows creating more complex test cases, with parameters and grouping. But on the default project there is little to notice.

## Tests structure

Unit and integration tests are stored in different class paths, this way it is easy to pick one or other type of test. For this the test/resources folder includes two XML files, which are actually TestNG suites: the 'tests\_maven\_unit\_suite.xml' will run all the unit tests, and the 'tests\_maven\_integration\_suite.xml' will run all the integration tests.

Additionally, to better differentiate them, unit tests are expected to start with the 'Test' keyword, and the integration ones with the 'IT' keyword.

Note that the classpath offered for the tests has 'testing.test' as part of it. The reason is that if additional classes are required for the tests a 'testing.framework', or similar, package can be added, separating the actual tests from the support classes.

## Reports

Reports are generated on the Maven site for both unit and integration tests, and this is done by Surefire and Failsafe, the same plugins which take care of running the tests. After that JaCoCo will make a coverage report.

## Logging

Testing requires Log4J for logging, and this is included as a dependency with the 'test' scope.

The configuration file, named 'log4j.xml', can be found on the tests resources folder.

## Summing it up

### Unit tests

Units test are run by the **tests\_maven\_unit\_suite.xml** test suite, and should start with the 'Test' prefix.

They can be run using the command:

```sh
$ mvn test
```

### Integration tests

Units test are run by the **tests\_maven\_integration\_suite.xml** test suite, and should start with the 'IT' prefix.

They can be run using the command:

```sh
$ mvn verify
```

This command won't just run the integration tests, *it will run first the unit tests, and then the integration tests*.
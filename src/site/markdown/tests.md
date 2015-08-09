# Tests

The Archetype comes prepared for running both unit and integration tests. They will be kept separated, on two different class paths, with two different tests suites, and run by two different plugins.

Surefire will be used to run unit tests, while Failsafe will take care of integration ones.

## Tests framework

TestNG comes prepared to be used as the tests framework, and is included through the 'test' scope.

There are several reasons for picking this against JUnit, mostly that it makes easier creating more complex test cases, such as parameterized or grouped tests.

## Tests structure

Unit and integration tests are stored in different class paths, this way it is easy to pick one or other type of test. The test/resources folder includes two TestNG suites in XML files: the 'tests\_maven\_unit\_suite.xml' will run all the unit tests, and the 'tests\_maven\_integration\_suite.xml' will run all the integration tests.

### Naming the tests

While not required, it is recommented to start the name of unit test classes with the 'Test' keyword, and the integration test classes with the 'IT' keyword.

### Tests classpath

It may seem strange that the classpath for the tests has 'testing.test' as part of it. The reason is that if additional classes are required for the tests they should be added into a 'testing.framework', or similar, package. Keeping the actual tests separated from any helper class.

## Reports

Reports are generated on the Maven Site for both unit and integration tests, and this is done by Surefire and Failsafe, the same plugins which take care of running the tests. 

A coverage report, created with JaCoCo, is also included.

## Logging

Testing requires Log4J for logging, and this is included as a dependency with the 'test' scope.

The configuration file, named 'log4j.xml', can be found on the tests resources folder.

## Running the tests

The common way to run tests through Maven is:

```sh
$ mvn test
```

But this won't run the integration tests. To run these tests, which will first run the unit tests, the following command should be used:

```sh
$ mvn verify
```
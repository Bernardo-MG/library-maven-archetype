# Tests

The archetype is prepared for both unit and integration tests. Note that running them through Maven requires different parameters.

The unit tests can be run using the command:

```
mvn test
```

While the integration tests are run using the command:

```
mvn verify
```

The 'verify' command won't just run the integration tests. First it will run the unit ones, then the integration tests.

## Testing framework

TestNG is meant to be used as the tests framework, and is included on the 'test' scope. All the tests configuration on the archetype has been prepared with this framework in mind.

## Tests structure

Unit and integration tests are meant to be stored separately. The archetype already does this, giving a tests classpath where the 'unit' and an 'integration' packages will store the tests of the type they share the name with.

Additionally, to better differentiate them, unit tests are expected to start with the 'Test' keyword, and the integration ones with the 'IT' keyword.

Note that the classpath offered for the tests has 'testing.test' as part of it. The reason is that if additional classes are required for the tests a 'testing.framework', or similar, package can be added.

## Test suites

On the test/resources folder there are two files defining the tests suites.

The one named 'tests\_maven\_unit\_suite.xml' is for the unit tests, while the one named  'tests\_maven\_integration\_suite.xml' is for the integration ones.

Both should be edited to indicate the path to the actual test folders, but will point by default to the initial location of the placeholder test classes.

## Reports

Reports are generated on the Maven file for both unit and integration tests.

For this the Surefire report, for unit tests, and the Failsafe report, for integration tests, plugins are used.

There is also a coverage report, generated with JaCoCo.

## Logging

TestNG makes use of Log4J for logging, and this is included as a dependency with the 'test' scope.

The configuration file, named 'log4j.xml', can be found on the tests resources folder.
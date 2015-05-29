package ${package}.testing.test.unit;

import org.testng.Assert;
import org.testng.annotations.Test;

import ${package}.Greeter;

public final class TestUnit {

    public TestUnit() {
        super();
    }

    @Test
    public final void sayHello() {
        Assert.assertEquals("Hello World!", new Greeter().sayHello());
    }

}
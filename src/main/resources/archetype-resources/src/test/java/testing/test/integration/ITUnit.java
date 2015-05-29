package ${package}.testing.test.integration;

import org.testng.Assert;
import org.testng.annotations.Test;

import ${package}.Greeter;

public final class ITUnit {

    public ITUnit() {
        super();
    }

    @Test
    public final void sayHello() {
        Assert.assertEquals("Hello World!", new Greeter().sayHello());
    }

}
package model;

import model.Column;
import org.junit.Assert;
import org.junit.Test;

public class ColumnTest {



    @Test
    public void columenTest() {
        Column column = new Column();
        column.setColumnType("varchar(20)");
        column.setColumnName("name");
        column.setRequired("true");

        Assert.assertEquals(column.getColumnName(),"name");
        Assert.assertEquals(column.getColumnType(),"varchar(20)");
        Assert.assertEquals(column.getRequired(),"true");

    }
}

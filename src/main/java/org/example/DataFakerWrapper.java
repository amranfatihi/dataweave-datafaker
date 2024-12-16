package org.example;

import net.datafaker.Faker;

import java.lang.reflect.Method;

public class DataFakerWrapper {
    private static final Faker faker = new Faker();

    // Private constructor to prevent instantiation
    private DataFakerWrapper() {}

    public static String fake(String category, String method) {
        try {
            // Get the category method (e.g., name(), address())
            Method categoryMethod = faker.getClass().getMethod(category);
            Object categoryObject = categoryMethod.invoke(faker);

            // Get and invoke the specific method within the category (e.g., fullName(), streetAddress())
            Method specificMethod = categoryObject.getClass().getMethod(method);
            return (String) specificMethod.invoke(categoryObject);
        } catch (Exception e) {
            throw new RuntimeException("Failed to generate fake data for " + category + "." + method, e);
        }
    }
}
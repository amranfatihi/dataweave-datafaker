# DataWeave DataFaker

A DataWeave wrapper for the [DataFaker](https://www.datafaker.net/) library, allowing you to generate fake data directly in your DataWeave transformations.

## Overview

This library provides a simple way to use DataFaker's extensive fake data generation capabilities within DataWeave scripts. It bridges the gap between Java's DataFaker library and DataWeave, making it easy to generate realistic test data for your Mule applications.

## Installation

### Optional

- Update the package in `DataFakerWrapper.java`:
```java
package your.organization.name;
```

- Update the import in `DataFaker.dwl`:
```dataweave
import java!your::organization::name::DataFakerWrapper
```

### Local


```shell
mvn clean install -Dexchange.orgId=<CH BG ID>
```

### Cloudhub

```shell
mvn clean deploy -Dexchange.orgId=<CH BG ID>
```

## Usage

Add the following dependency to your `pom.xml`:

```xml
<dependency>
    <groupId>org.example</groupId>
    <artifactId>dataweave-datafaker</artifactId>
    <version>${version}</version>
    <classifier>dw-library</classifier>
</dependency>

```

Use the `fake` function to generate data:

```dataweave
%dw 2.0
output application/json
import * from DataFaker
---
{
    name: fake("name", "fullName"),
    address: fake("address", "streetAddress"),
    company: fake("company", "name")
}
```

The `fake` function takes two parameters:
- `provider`: The DataFaker category (e.g., "name", "address", "company")
- `function`: The specific method within that category (e.g., "fullName", "streetAddress")

### More Examples

```dataweave
%dw 2.0
output application/json
import * from DataFaker
---
{
    user: {
        name: fake("name", "fullName"),
        username: fake("name", "username"),
        email: fake("internet", "emailAddress"),
        phone: fake("phoneNumber", "cellPhone"),
        address: {
            street: fake("address", "streetAddress"),
            city: fake("address", "city"),
            country: fake("address", "country")
        }
    }
}
```

## Available Providers and Functions

This wrapper supports all DataFaker providers. Here are some commonly used ones:

- `name`: fullName, firstName, lastName, username
- `address`: streetAddress, city, country, zipCode
- `internet`: emailAddress, url, ipV4Address
- `company`: name, industry, buzzword
- `phoneNumber`: cellPhone, phoneNumber
- `commerce`: productName, price, department
- `dateTime`: future, past, birthday

For a complete list of available providers and functions, refer to the [DataFaker documentation](https://www.datafaker.net/documentation/providers/).

## Running Tests

The project includes tests to verify the functionality. Run them using:

```bash
mvn test
```

## Requirements

- DataWeave 2.0 or higher
- Java 8 or higher
- Maven 3.x

## License

This project is licensed under the MIT License - see the LICENSE file for details.
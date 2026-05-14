# Hello World (Java)

A minimal Java + Maven "Hello, World!" project intended for testing CI/CD pipelines.

## Requirements

- JDK 17+
- Maven 3.8+

## Build & test

```bash
mvn clean verify
```

## Run

```bash
java -jar target/hello-world.jar
# -> Hello, World!

java -jar target/hello-world.jar Cursor   # (arg is ignored, kept simple)
```

Or run directly via Maven:

```bash
mvn -q exec:java -Dexec.mainClass=com.example.App
```

## Project layout

```
.
├── pom.xml
├── src
│   ├── main/java/com/example/App.java
│   └── test/java/com/example/AppTest.java
└── .github/workflows/ci.yml   # GitHub Actions pipeline
```

## CI/CD

A GitHub Actions workflow is provided in `.github/workflows/ci.yml` that:

1. Sets up JDK 17 (Temurin) with Maven cache.
2. Runs `mvn clean verify` (compile + tests).
3. Executes the resulting JAR.
4. Uploads the built JAR as a workflow artifact.

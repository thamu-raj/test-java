package com.example;

public class App {

    public static void main(String[] args) {
        System.out.println(greet("World"));
    }

    public static String greet(String name) {
        if (name == null || name.isBlank()) {
            name = "World";
        }
        return "Hello, " + name + "!";
    }
}

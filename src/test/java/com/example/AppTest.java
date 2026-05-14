package com.example;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;

class AppTest {

    @Test
    void greetsTheWorldByDefault() {
        assertEquals("Hello, World!", App.greet(null));
        assertEquals("Hello, World!", App.greet(""));
    }

    @Test
    void greetsTheProvidedName() {
        assertEquals("Hello, Cursor!", App.greet("Cursor"));
    }
}

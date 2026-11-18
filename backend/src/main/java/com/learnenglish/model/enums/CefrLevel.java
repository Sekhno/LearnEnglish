package com.learnenglish.model.enums;

public enum CefrLevel {
    A1("Beginner"),
    A2("Elementary"),
    B1("Intermediate"),
    B2("Upper-Intermediate"),
    C1("Advanced");

    private final String displayName;

    CefrLevel(String displayName) {
        this.displayName = displayName;
    }

    public String getDisplayName() {
        return displayName;
    }
}

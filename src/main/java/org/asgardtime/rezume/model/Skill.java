package org.asgardtime.rezume.model;

import lombok.AllArgsConstructor;

@AllArgsConstructor
public enum Skill {
    JAVA_SYNTAX("Java Syntax"),
    JAVA_CORE("Java Core"),
    GIT("GIT"),
    DATA_BASE("Data Base"),
    MAVEN("Maven"),
    SOLID("SOLID"),
    TELEGRAM_BOTS_API("Telegram Bots API"),;
    private String name;
}

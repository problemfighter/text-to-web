package com.problemfighter.texttoweb.common;

public class TextToWebException extends Exception {

    public TextToWebException() {
        super("TM Exception");
    }

    public TextToWebException(String message) {
        super(message);
    }

}

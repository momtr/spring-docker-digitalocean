package com.example.app.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class RandomNumberController {

    @GetMapping("/random/numbers")
    public double getRandomNumber() {
        return Math.random();
    }

}

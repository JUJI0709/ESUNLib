package com.example.esunlib;


import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/")
public class TestControler {
    @GetMapping
    public ResponseEntity<String> Hello(){
//        System.out.println("Hello World!");
        return ResponseEntity.ok("Hello World!");
    }
}


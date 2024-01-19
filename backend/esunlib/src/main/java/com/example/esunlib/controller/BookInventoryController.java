package com.example.esunlib.controller;

import com.example.esunlib.model.BookInventory;
import com.example.esunlib.repository.BookInventoryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
@CrossOrigin(origins = "http://localhost:5173")
@RestController
@RequestMapping("/api/booksInv")

public class BookInventoryController {
    @Autowired
    private BookInventoryRepository bookInventoryRepository;

    @GetMapping
    public List<BookInventory> getAllBookInventory() {
        return bookInventoryRepository.findAll();
    }
}

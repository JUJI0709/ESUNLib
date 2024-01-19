package com.example.esunlib.repository;

import com.example.esunlib.model.BookInventory;
import org.springframework.data.jpa.repository.JpaRepository;

public interface BookInventoryRepository extends JpaRepository<BookInventory, String>{
}

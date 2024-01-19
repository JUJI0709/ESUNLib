package com.example.esunlib.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "bookinventory")
public class BookInventory {
    @Id
    @Column(name = "inventory_id")
    private Long inventoryId;

    @Column(name = "isbn")
    private String isbn;

    @Column(name = "author")
    private String author;

    @Column(name = "book_name")
    private String bookName;

    @Column(name = "status")
    private String status;

    protected BookInventory(){}


    public Long getInventory_Id(){return inventoryId;}

    public String getISBN(){return isbn;}
    public String getAuthor(){return author;}
    public String getBookName(){return bookName;}
    public String getStatus(){return status;}
}

package com.example.esunlib.repository;

import com.example.esunlib.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
public interface UserRepository extends JpaRepository<User,String> {
}

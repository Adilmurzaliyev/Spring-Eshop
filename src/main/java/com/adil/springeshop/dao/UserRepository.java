package com.adil.springeshop.dao;

import com.adil.springeshop.domain.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository<User, Long> {
    User findFirstByName (String name);

}

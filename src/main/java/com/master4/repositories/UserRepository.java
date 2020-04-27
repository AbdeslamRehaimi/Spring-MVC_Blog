package com.master4.repositories;

import com.master4.entities.User;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;


@Repository
public interface UserRepository extends JpaRepository<User, Long> {

    Page<User> findAll(Pageable pageable);

    @Query("select u from User u  where u.email=:email and u.password=:password")
    User findUserByLogin(@Param("email") String email, @Param("password") String password);

    @Query("select u from User u  where u.email=:email")
    User findUserByEmail(@Param("email") String email);

}

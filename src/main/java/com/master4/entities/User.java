package com.master4.entities;


import lombok.*;
import lombok.experimental.FieldDefaults;

import javax.persistence.*;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;
import java.io.Serializable;
import java.util.Date;
import java.util.List;

@FieldDefaults(level=AccessLevel.PRIVATE)
@NoArgsConstructor
@AllArgsConstructor
@Setter @Getter
@Entity
@Table(name="users")
public class User implements Serializable {

     static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    long id;

    @Column(name="nom", nullable = false, unique = true, length = 150 )
    @NotBlank(message = "Vous devez indiquer votre nom !")
    @Size(min=3, message = "minimum 3 lettre")
    @Email
    String nom;

    @Column(name="prenom", nullable = false, unique = true, length = 150 )
    @NotBlank(message = "Vous devez indiquer votre prenom !")
    @Size(min=3, message = "minimum 3 lettre")
    @Email
    String prenom;

    @Column(name="email", nullable = false, unique = true)
    @NotBlank(message = "Vous devez indiquer l'email !")
    @Email
    String email;

    @Column(name="password", nullable = false, length = 150 )
    @NotBlank(message = "Vous devez indiquer votre mot de passe !")
    @Size(min=6, message = "minimum 6 lettre")
    String password;

    @Transient
    @Size(min=6, message = "minimum 6 lettre")
    @NotBlank(message = "Retaper  le mot de passe !!")
    String confirmedPassword;

    @Column(name="role")
    String role;

    @Column(name="created")
    @Temporal(TemporalType.TIMESTAMP)
     Date created;
    @Column(name="modified")
    @Temporal(TemporalType.TIMESTAMP)
     Date modified;

    @OneToMany(cascade=CascadeType.ALL)
    @JoinColumn(name="user_id")
     List<Article> articles;

    public User(long id) {
        this.id=id;
    }
}

package com.master4.entities;


import lombok.*;
import lombok.experimental.FieldDefaults;
import org.hibernate.annotations.Type;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;
import java.io.Serializable;
import java.util.Date;
import java.util.List;

@FieldDefaults(level= AccessLevel.PRIVATE)
@NoArgsConstructor
@AllArgsConstructor
@Setter @Getter
@Entity
@Table(name = "articles")
public class Article implements Serializable {

    static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    long id;

    @Size(min=3, message = "minimum 3 lettre")
    @NotBlank(message = "Vous devez indiquer un titre!")
    @Column(name = "title", length = 150 )
    String title;

    @Column(name = "body" )
    @NotBlank(message = "Ajouter un contenu !")
    @Type(type="text")
    String body;

    @Column(name="published",columnDefinition = "int default 0")
    Boolean published;

    @Column(name = "image")
    private String image;

    @Column(name = "created")
    @Temporal(TemporalType.TIMESTAMP)
    Date created;

    @Column(name = "modified")
    @Temporal(TemporalType.TIMESTAMP)
    Date modified ;


    @ManyToOne
    User user;

    @Size(min=1,message = "selectionner au moins une tag")
    @ManyToMany(fetch = FetchType.EAGER)
    @JoinTable(name="articles_tags", joinColumns={@JoinColumn(referencedColumnName="id")}
            , inverseJoinColumns={@JoinColumn(referencedColumnName="id")})
    List<Tag> tagList;

}

package com.master4.entities;


import lombok.*;
import lombok.experimental.FieldDefaults;
import org.hibernate.annotations.ManyToAny;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import java.io.Serializable;
import java.util.Date;
import java.util.List;

@FieldDefaults(level= AccessLevel.PRIVATE)
@AllArgsConstructor
@NoArgsConstructor
@Setter @Getter
@Entity
@Table(name="tags")
public class Tag implements Serializable {

    static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    long id;


    @Column(name = "name", nullable = false, unique = true, length = 150)
    @NotBlank(message = "Vous devez indiquer un type du tag !")
    String  title;

    @Column(name = "created")
    @Temporal(TemporalType.TIMESTAMP)
    Date created;

    @Column(name = "modified")
    @Temporal(TemporalType.TIMESTAMP)
    Date modified ;


    @ManyToMany(mappedBy="tagList")
    List<Article> ArticleList;


    @Transient
    Boolean used;

    public Tag(long id) {
        this.id=id;
    }
}

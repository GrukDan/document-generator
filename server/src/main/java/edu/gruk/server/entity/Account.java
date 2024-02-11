package edu.gruk.server.entity;

import edu.gruk.server.entity.audit.Auditable;
import jakarta.persistence.*;
import lombok.Data;
import lombok.Getter;

@Getter
@Entity
@Table(name = "account")
@Audited
public class Account extends Auditable {

    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "account_name")
    private String accountName;

    @Column(name = "email")
    private String email;
}

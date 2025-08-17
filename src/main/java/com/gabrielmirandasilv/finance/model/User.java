package com.gabrielmirandasilv.finance.model;

import jakarta.persistence.*;
import org.springframework.data.annotation.Id;

import java.util.List;

@Entity
@Table(name = "users")
public class User {

        @Id
        @GeneratedValue(strategy = GenerationType.IDENTITY)
        private Long id;

        @Column(nullable = false, unique = true)
        private String username;

        @Column(nullable = false)
        private String passwordHash;

        @Column(nullable = false, unique = true)
        private String email;

        // Relacionamentos
        @OneToMany(mappedBy = "user", cascade = CascadeType.ALL, orphanRemoval = true)
        private List<Income> incomes;

        @OneToMany(mappedBy = "user", cascade = CascadeType.ALL, orphanRemoval = true)
        private List<Expense> expenses;

        // Construtores
        public User() {}

        public User(String username, String passwordHash, String email) {
            this.username = username;
            this.passwordHash = passwordHash;
            this.email = email;
        }

        // Getters e Setters
        public Long getId() {
            return id;
        }

        public void setId(Long id) {
            this.id = id;
        }

        public String getUsername() {
            return username;
        }

        public void setUsername(String username) {
            this.username = username;
        }

        public String getPasswordHash() {
            return passwordHash;
        }

        public void setPasswordHash(String passwordHash) {
            this.passwordHash = passwordHash;
        }

        public String getEmail() {
            return email;
        }

        public void setEmail(String email) {
            this.email = email;
        }

        public List<Income> getIncomes() {
            return incomes;
        }

        public void setIncomes(List<Income> incomes) {
            this.incomes = incomes;
        }

        public List<Expense> getExpenses() {
            return expenses;
        }

        public void setExpenses(List<Expense> expenses) {
            this.expenses = expenses;
        }
    }



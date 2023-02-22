package com.academia.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.academia.entity.Pessoa;

public interface PessoaRepository extends JpaRepository<Pessoa, Long> {

}

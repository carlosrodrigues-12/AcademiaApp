package com.academia.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.academia.entity.Exercicio;

public interface ExercicioRepository extends JpaRepository<Exercicio, Long> {

}

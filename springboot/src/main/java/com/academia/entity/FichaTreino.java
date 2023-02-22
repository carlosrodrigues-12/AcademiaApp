package com.academia.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class FichaTreino {

	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id_ficha")
    private long id;
	
	@Column
    private Long pessoa;
	
	@Column
	private Long exercicio;

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public Long getPessoa() {
		return pessoa;
	}

	public void setPessoa(Long pessoa) {
		this.pessoa = pessoa;
	}

	public Long getExercicio() {
		return exercicio;
	}

	public void setExercicio(Long exercicio) {
		this.exercicio = exercicio;
	}

	
}

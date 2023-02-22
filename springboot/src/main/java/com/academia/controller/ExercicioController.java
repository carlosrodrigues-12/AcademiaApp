package com.academia.controller;

import java.util.List;
import java.util.Optional;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.academia.entity.Exercicio;
import com.academia.repository.ExercicioRepository;
import com.academia.responses.Response;

@RestController
public class ExercicioController {

	@Autowired
	private ExercicioRepository exercicioRepository;
	
	@GetMapping("/exercicio/listar")
	public List<Exercicio> Get(){
		return exercicioRepository.findAll();
	}
	
	@GetMapping("/exercicio/listar/{id}")
	public ResponseEntity<Exercicio> GetById(@PathVariable long id){
		Optional<Exercicio> exercicio = exercicioRepository.findById(id);
	    if(exercicio.isPresent())
	        return new ResponseEntity<Exercicio>(exercicio.get(), HttpStatus.OK);
	    else
	        return new ResponseEntity<>(HttpStatus.NOT_FOUND);
	}
	
	@PostMapping("/exercicio/salvar")
	public ResponseEntity<Response<Exercicio>> Post(@Valid @RequestBody Exercicio exercicio, BindingResult result)
	{
		Response<Exercicio> response = new Response<Exercicio>();    	
		if (result.hasErrors()) {
			result.getAllErrors().forEach(error -> response.getErrors().add(error.getDefaultMessage()));
			return ResponseEntity.badRequest().body(response);
		}
		exercicioRepository.save(exercicio);
		response.setData(exercicio);
	    return ResponseEntity.ok(response);
	}
	
	@PutMapping("/exercicio/atualizar/{id}")
    public ResponseEntity<Response<Exercicio>>
    Put(@PathVariable long id, @Valid @RequestBody Exercicio newExercicio, BindingResult result)
	{
    	Optional<Exercicio> oldExercicio = exercicioRepository.findById(id);
    	Response<Exercicio> response = new Response<Exercicio>();    	
	  	if (result.hasErrors()) {
	  		result.getAllErrors().forEach(error -> response.getErrors().add(error.getDefaultMessage()));
	  		return ResponseEntity.badRequest().body(response);
	  	}        	        
	      if(oldExercicio.isPresent()){
	        Exercicio exercicio = oldExercicio.get();
	        exercicio.setNome(newExercicio.getNome());
	        exercicio.setDescricao(newExercicio.getDescricao());
	        exercicio.setSeries(newExercicio.getSeries());
	        exercicio.setRepeticoes(newExercicio.getRepeticoes());
	      	exercicio.setEquipamento(newExercicio.getEquipamento());
	        response.setData(exercicio);
	        exercicioRepository.save(exercicio);
	        return ResponseEntity.ok(response);
	      }
	      else
	        return new ResponseEntity<>(HttpStatus.NOT_FOUND);
	  }
	
	@DeleteMapping("/exercicio/deletar/{id}")
    public ResponseEntity<Object> Delete(@PathVariable long id)
    {
        Optional<Exercicio> exercicio = exercicioRepository.findById(id);
        if(exercicio.isPresent()){
            exercicioRepository.delete(exercicio.get());
            return new ResponseEntity<>(HttpStatus.OK);
        }
        else
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
    }
}

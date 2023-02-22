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

import com.academia.entity.FichaTreino;
import com.academia.repository.FichaTreinoRepository;
import com.academia.responses.Response;

@RestController
public class FichaTreinoController {

	@Autowired
	private FichaTreinoRepository fichaTreinoRepository;
	
	@GetMapping("/fichatreino/listar")
	public List<FichaTreino> Get(){
		return fichaTreinoRepository.findAll();
	}
	
	@GetMapping("/fichatreino/listar/{id}")
	public ResponseEntity<FichaTreino> GetById(@PathVariable long id){
		Optional<FichaTreino> fichaTreino = fichaTreinoRepository.findById(id);
	    if(fichaTreino.isPresent())
	        return new ResponseEntity<FichaTreino>(fichaTreino.get(), HttpStatus.OK);
	    else
	        return new ResponseEntity<>(HttpStatus.NOT_FOUND);
	}
	
	@PostMapping("/fichatreino/salvar")
	public ResponseEntity<Response<FichaTreino>> Post(@Valid @RequestBody FichaTreino fichaTreino, BindingResult result)
	{
		Response<FichaTreino> response = new Response<FichaTreino>();    	
		if (result.hasErrors()) {
			result.getAllErrors().forEach(error -> response.getErrors().add(error.getDefaultMessage()));
			return ResponseEntity.badRequest().body(response);
		}
		fichaTreinoRepository.save(fichaTreino);
		response.setData(fichaTreino);
	    return ResponseEntity.ok(response);
	}
	
	@PutMapping("/fichatreino/atualizar/{id}")
    public ResponseEntity<Response<FichaTreino>>
    Put(@PathVariable long id, @Valid @RequestBody FichaTreino newFichaTreino, BindingResult result)
	{
    	Optional<FichaTreino> oldFichaTreino = fichaTreinoRepository.findById(id);
    	Response<FichaTreino> response = new Response<FichaTreino>();    	
	  	if (result.hasErrors()) {
	  		result.getAllErrors().forEach(error -> response.getErrors().add(error.getDefaultMessage()));
	  		return ResponseEntity.badRequest().body(response);
	  	}        	        
	      if(oldFichaTreino.isPresent()){
	        FichaTreino fichaTreino = oldFichaTreino.get();
	        fichaTreino.setExercicio(newFichaTreino.getExercicio());
	        response.setData(fichaTreino);
	        fichaTreinoRepository.save(fichaTreino);
	        return ResponseEntity.ok(response);
	      }
	      else
	        return new ResponseEntity<>(HttpStatus.NOT_FOUND);
	  }
	
	@DeleteMapping("/fichatreino/deletar/{id}")
    public ResponseEntity<Object> Delete(@PathVariable long id)
    {
        Optional<FichaTreino> fichaTreino = fichaTreinoRepository.findById(id);
        if(fichaTreino.isPresent()){
            fichaTreinoRepository.delete(fichaTreino.get());
            return new ResponseEntity<>(HttpStatus.OK);
        }
        else
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
    }
}

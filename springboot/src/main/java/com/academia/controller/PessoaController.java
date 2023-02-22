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

import com.academia.entity.Pessoa;
import com.academia.repository.PessoaRepository;
import com.academia.responses.Response;

@RestController
public class PessoaController {
	@Autowired
	private PessoaRepository pessoaRepository;
	
	@GetMapping("/pessoa/listar")
	public List<Pessoa> Get() {
        return pessoaRepository.findAll();
    }
	
    @GetMapping("/pessoa/listar/{id}")
    public ResponseEntity<Pessoa> GetById(@PathVariable long id)
    {
        Optional<Pessoa> pessoa = pessoaRepository.findById(id);
        if(pessoa.isPresent())
            return new ResponseEntity<Pessoa>(pessoa.get(), HttpStatus.OK);
        else
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
    }
    
    @PostMapping("/pessoa/salvar")
    public ResponseEntity<Response<Pessoa>> Post(@Valid @RequestBody Pessoa pessoa, BindingResult result)
    {
    	Response<Pessoa> response = new Response<Pessoa>();    	
    	if (result.hasErrors()) {
    		result.getAllErrors().forEach(error -> response.getErrors().add(error.getDefaultMessage()));
    		return ResponseEntity.badRequest().body(response);
    	}
    	pessoaRepository.save(pessoa);
    	response.setData(pessoa);
        return ResponseEntity.ok(response);
    }
    
    @PutMapping("/pessoa/atualizar/{id}")
    public ResponseEntity<Response<Pessoa>>
    Put(@PathVariable long id, @Valid @RequestBody Pessoa newPessoa, BindingResult result)
	{
    	Optional<Pessoa> oldPessoa = pessoaRepository.findById(id);
    	Response<Pessoa> response = new Response<Pessoa>();    	
	  	if (result.hasErrors()) {
	  		result.getAllErrors().forEach(error -> response.getErrors().add(error.getDefaultMessage()));
	  		return ResponseEntity.badRequest().body(response);
	  	}        	        
	      if(oldPessoa.isPresent()){
	        Pessoa pessoa = oldPessoa.get();
	        pessoa.setNome(newPessoa.getNome());
	        pessoa.setCpf(newPessoa.getCpf());
	        pessoa.setSexo(newPessoa.getSexo());
	        pessoa.setNascimento(newPessoa.getNascimento());
	      	pessoa.setPeso(newPessoa.getPeso());
	      	pessoa.setAltura(newPessoa.getAltura());
	      	pessoa.setTelefone(newPessoa.getTelefone());
	      	pessoa.setObservacao(newPessoa.getObservacao());
	      	pessoa.setEmail(newPessoa.getEmail());
	      	pessoa.setFuncao(newPessoa.getFuncao());
	      	pessoa.setSalario(newPessoa.getSalario());
	      	pessoa.setTurno(newPessoa.getTurno());
	      	pessoa.setTipocadastro(newPessoa.getTipocadastro());
	        response.setData(pessoa);
	        pessoaRepository.save(pessoa);
	        return ResponseEntity.ok(response);
	      }
	      else
	        return new ResponseEntity<>(HttpStatus.NOT_FOUND);
	  }
    
    @DeleteMapping("/pessoa/deletar/{id}")
    public ResponseEntity<Object> Delete(@PathVariable long id)
    {
        Optional<Pessoa> pessoa = pessoaRepository.findById(id);
        if(pessoa.isPresent()){
            pessoaRepository.delete(pessoa.get());
            return new ResponseEntity<>(HttpStatus.OK);
        }
        else
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
    }  
}

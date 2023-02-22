package com.academia.responses;

import java.util.ArrayList;
import java.util.List;

public class Response<T> {

	// Objeto usado em casos de sucesso
	private T data;
	
	// Objeto usado em casos de erro
	private List<String> errors;
	
	public Response() {
		this.errors = new ArrayList<String>();
	}
	public T getData() {
		return data;
	}
	public void setData(T data) {
		this.data = data;
	}
	public List<String> getErrors() {
		return errors;
	}
	public void setErrors(List<String> errors) {
		this.errors = errors;
	}
	
	
}

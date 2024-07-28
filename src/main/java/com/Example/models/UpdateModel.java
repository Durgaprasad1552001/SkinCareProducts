package com.Example.models;

public class UpdateModel {
	 private String username;
	    private String firstname;
	    
	    public UpdateModel() {}

	    public UpdateModel(String fn , String pwd) {
	        this.username  = fn;
	        this.firstname = pwd ;
	        
	    }

	    public String getusername() {
	        return username;
	    }

	    public void setusername(String uname) {
	        username = uname ;
	    }
	    public void setfirstname(String firstname) {
	    	this.firstname =  firstname; 
	    	
	    }
	    public String getfirstname() {
	    	return firstname;
	    }

	    public String toString() {
	        return firstname ;
	        
	        
	    }
	}


package com.bean;

public class Feedback {
	private int id;
	private String name, email, subject, details;

	public int getId() {
		return id;
	}
	
	public void setId(int id) {
		this.id = id;
	}
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getDetails() {
		return details;
	}

	public void setDetails(String details) {
		this.details = details;
	}
	
	public Feedback() {
		
	}

	public Feedback(int id, String name, String email, String subject, String details) {
		this.id = id;
		this.name = name;
		this.email = email;
		this.subject = subject;
		this.details = details;
	}

	@Override
	public String toString() {
		return "Feedback [id=" + id + ", name=" + name + ", email=" + email
				+ ", subject=" + subject + ", details=" + details + "]";
	}
}

package com.bean;

public class User {
	private int id;
	private String username, passsword, name, email, contactNo, role;
	
	public int getId() {
		return id;
	}
	
	public void setId(int id) {
		this.id = id;
	}
	
	public String getUsername() {
		return username;
	}
	
	public void setUsername(String username) {
		this.username = username;
	}
	
	public String getPasssword() {
		return passsword;
	}
	
	public void setPasssword(String passsword) {
		this.passsword = passsword;
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
	
	public String getContactNo() {
		return contactNo;
	}
	
	public void setContactNo(String contactNo) {
		this.contactNo = contactNo;
	}
	
	public String getRole() {
		return role;
	}
	
	public void setRole(String role) {
		this.role = role;
	}
	
	public User() {
		
	}
	
	public User(int id) {
		this.id = id;
	}
	
	public User(String name) {
		this.name = name;
	}
	
	public User(String username, String passsword, String name, String email, String contactNo, String role) {
		this.username = username;
		this.passsword = passsword;
		this.name = name;
		this.email = email;
		this.contactNo = contactNo;
		this.role = role;
	}

	public User(int id, String username, String passsword, String name, String email, String contactNo, String role) {
		this.id = id;
		this.username = username;
		this.passsword = passsword;
		this.name = name;
		this.email = email;
		this.contactNo = contactNo;
		this.role = role;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", username=" + username + ", passsword="
				+ passsword + ", name=" + name + ", email=" + email
				+ ", contactNo=" + contactNo + ", role=" + role + "]";
	}
}

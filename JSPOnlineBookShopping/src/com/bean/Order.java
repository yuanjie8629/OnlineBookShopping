package com.bean;

import java.util.Date;

public class Order {
	private int id, quantity;
	private double price;
	private Date purchaseDate;
	private Book book;
	private User customer;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	
	public Date getPurchaseDate() {
		return purchaseDate;
	}

	public void setPurchaseDate(Date purchaseDate) {
		this.purchaseDate = purchaseDate;
	}
	
	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public Book getBook() {
		return book;
	}

	public void setBook(Book book) {
		this.book = book;
	}

	public User getCustomer() {
		return customer;
	}

	public void setCustomer(User customer) {
		this.customer = customer;
	}

	public Order() {
		
	}
	
	public Order(Book book, int quantity, User customer, double price, Date purchaseDate) {
		this.quantity = quantity;
		this.price = price;
		this.purchaseDate = purchaseDate;
		this.book = book;
		this.customer = customer;
	}

	public Order(int id, Book book, int quantity, User customer, double price, Date purchaseDate) {
		this.id = id;
		this.quantity = quantity;
		this.purchaseDate = purchaseDate;
		this.book = book;
		this.customer = customer;
		this.price = price;
	}

	@Override
	public String toString() {
		return "Order [id=" + id + ", quantity=" + quantity + ", price="
				+ price + ", purchaseDate=" + purchaseDate + ", book=" + book
				+ ", customer=" + customer + "]";
	}
}

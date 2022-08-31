package com.bean;

import java.util.Arrays;

import com.util.FileUtils;

public class Book {
	private String name, author, category;
	private int id, stock;
	private double price;
	private byte[] image;
	
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
	
	public String getAuthor() {
		return author;
	}
	
	public void setAuthor(String author) {
		this.author = author;
	}
	
	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}
	
	public int getStock() {
		return stock;
	}
	
	public void setStock(int stock) {
		this.stock = stock;
	}
	
	public double getPrice() {
		return price;
	}
	
	public void setPrice(double price) {
		this.price = price;
	}

	public byte[]  getImage() {
		return image;
	}
	
	public String getEncodedImage() {
		return FileUtils.toBase64(this.image);
	}

	public void setImage(byte[] image) {
		this.image = image;
	}

	public Book() {
			
	}
	
	public Book(int id) {
		this.id = id;
	}
	
	public Book(String name) {
		this.name = name;
	}
	
	public Book(String name, String author) {
		this.name = name;
		this.author = author;
	}
	
	public Book(String name, String author, String category, int stock, double price, byte[] image) {
		this.name = name;
		this.author = author;
		this.category = category;
		this.stock = stock;
		this.price = price;
		this.image = image;
	}

	public Book(int id, String name, String category, String author, int stock, double price, byte[] image) {
		this.id = id;
		this.name = name;
		this.category = category;
		this.author = author;
		this.stock = stock;
		this.price = price;
		this.image = image;
	}

	@Override
	public String toString() {
		return "Book [name=" + name + ", author=" + author + ", category="
				+ category + ", id=" + id + ", stock=" + stock + ", price="
				+ price + ", image=" + Arrays.toString(image) + "]";
	}

	// Make book unique by ID (for compare)
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + id;
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Book other = (Book) obj;
		if (id != other.id)
			return false;
		return true;
	}
}

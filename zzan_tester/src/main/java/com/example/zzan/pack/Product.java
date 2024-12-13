package com.example.zzan.pack;

import java.sql.Timestamp;

public class Product {
	
    private int id;
    private String subject;
    private String original_filename;
    private String stored_filename;
    private long file_size;
    private String content;
    private String price;
    private Timestamp upload_date;
    private String category;
    
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getOriginal_filename() {
		return original_filename;
	}
	public void setOriginal_filename(String original_filename) {
		this.original_filename = original_filename;
	}
	public String getStored_filename() {
		return stored_filename;
	}
	public void setStored_filename(String stored_filename) {
		this.stored_filename = stored_filename;
	}
	public long getFile_size() {
		return file_size;
	}
	public void setFile_size(long file_size) {
		this.file_size = file_size;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public Timestamp getUpload_date() {
		return upload_date;
	}
	public void setUpload_date(Timestamp upload_date) {
		this.upload_date = upload_date;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
    
    
}

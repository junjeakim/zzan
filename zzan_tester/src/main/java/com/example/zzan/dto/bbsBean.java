package com.example.zzan.dto;

import java.sql.Timestamp;

public class bbsBean {

	private int idx;
	private String title;
	private String content;
	private String id;
	private Timestamp regTM;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Timestamp getRegTM() {
		return regTM;
	}
	public void setRegTM(Timestamp regTM) {
		this.regTM = regTM;
	}

}

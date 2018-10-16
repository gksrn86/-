package edu.smu.ss.vo;

public class Member {
	private String id;
	private String pw;
	private String email;
	
	public Member() {
		super();
	}

	public Member(String id, String pw, String email) {
		super();
		this.id = id;
		this.pw = pw;
		this.email = email;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Member [id=");
		builder.append(id);
		builder.append(", pw=");
		builder.append(pw);
		builder.append(", email=");
		builder.append(email);
		builder.append("]");
		return builder.toString();
	}	
	
}
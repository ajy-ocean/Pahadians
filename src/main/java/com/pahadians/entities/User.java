package com.pahadians.entities;

import java.sql.*;

public class User {
	private int id;
	private String name;
	private String email;
	private String password;
	private String genger;
	private String bio;
	private Timestamp dateTime;
	private String profile;

	public User() {

	}

	public User(int id, String name, String email, String password, String genger, String bio, Timestamp dateTime) {
		super();
		this.id = id;
		this.name = name;
		this.email = email;
		this.password = password;
		this.genger = genger;
		this.bio = bio;
		this.dateTime = dateTime;
	}

	public User(String name, String email, String password, String genger, String bio) {
		super();
		this.name = name;
		this.email = email;
		this.password = password;
		this.genger = genger;
		this.bio = bio;
	}

	//GETTER & SETTER
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

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getGenger() {
		return genger;
	}

	public void setGenger(String genger) {
		this.genger = genger;
	}

	public String getBio() {
		return bio;
	}

	public void setBio(String bio) {
		this.bio = bio;
	}

	public Timestamp getDateTime() {
		return dateTime;
	}

	public void setDateTime(Timestamp dateTime) {
		this.dateTime = dateTime;
	}

	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}
	
	
}
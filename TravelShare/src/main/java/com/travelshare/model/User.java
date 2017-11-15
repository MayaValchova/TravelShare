package com.travelshare.model;

import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

import org.springframework.stereotype.Component;


@Component
public class User {
	
	private int userID;
	private String username;
	private String password;
	private String email;
	private String firstName;
	private String lastName;
	private String pictureURL;
	private List<User> posts;
	private LinkedHashSet<User> followers;
	
	public User(){
		posts = new ArrayList<User>();
	};
	
	public User(String username, String password, String email, String firstName, String lastName, String pictureURL) {
		super();
		this.username = username;
		this.password = password;
		this.email = email;
		this.firstName = firstName;
		this.lastName = lastName;
		this.pictureURL = pictureURL;
		this.followers=new LinkedHashSet<User>();
	}
	
	public User(int userID, String uname, String password, String firstName, String lastName, String pictureURL) {
		super();
		this.userID = userID;
		this.username = uname;
		this.password = password;
		this.firstName = firstName;
		this.lastName = lastName;
		this.pictureURL = pictureURL;
		this.followers=new LinkedHashSet<User>();
	}
	
	
	public User(int userID, String uname, String email, String password, String firstName, String lastName, String pictureURL) {
		super();
		this.userID = userID;
		this.username = uname;
		this.email = email;
		this.password = password;
		this.firstName = firstName;
		this.lastName = lastName;
		this.pictureURL = pictureURL;
		this.followers=new LinkedHashSet<User>();
	}
	
	public User(String uname, String email, String firstName, String lastName) {
		super();
		this.username = uname;
		this.email = email;
		this.firstName = firstName;
		this.lastName = lastName;
		this.followers=new LinkedHashSet<User>();
	}
	
	public User(String email, String password) {
		super();
		this.password = password;
		this.email = email;
	}

	public User(String email) {
		super();
		this.email = email;
	}


	public String getPictureURL() {
		return pictureURL;
	}


	public void setPictureURL(String pictureURL) {
		this.pictureURL = pictureURL;
	}


	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
			this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		if (validateString(password)) {
			this.password = password;
		}
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		if (validateString(email)) {
			this.email = email;
		}
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		if (validateString(firstName)) {
			this.firstName = firstName;
		}
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		if (validateString(lastName)) {
			this.lastName = lastName;
		}
	}
	
	public int getUserID() {
		return userID;
	}


	public void setUserID(int userID) {
		this.userID = userID;
	}


	private static boolean validateString(String string) {
		return (string != null) && (string.length() > 0);
	}
	
	
	public void addFollower(User user){
		
		this.followers.add(user);
	}
	
	public LinkedHashSet<User> getFollowers() {
		
		return followers;
	}

	public void setFollowers(LinkedHashSet<User> followers) {
		this.followers = followers;
	}
	
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		User other = (User) obj;
		if (email == null) {
			if (other.email != null)
				return false;
		} else if (!email.equals(other.email))
			return false;
		return true;
	}

	public List<User> getPosts() {
		return posts;
	}

	public void setPosts(Set<Post> posts) {
		//this.posts = posts;
	}

	
}

package com.travelshare.model;

import java.io.File;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.stereotype.Component;

import com.travelshare.util.Encrypter;
import com.travelshare.util.UserException;

@Component
public class UserDAO {

	private static final String INSERT_USER_SQL = "INSERT INTO users VALUES (null, ?,?,?,?,?,?)";
	//private static final String CHECK_FOR_EMAIL = "SELECT user_id from users WHERE user_email LIKE ?%";
	private static final String SELECT_USER_SQL = "SELECT user_id FROM users WHERE email = ? AND password = ?";
	private static final String GET_USER_FROM_SQL = "SELECT user_id, username, password, first_name, last_name, avatar_url FROM users WHERE email = ?";
	private static final String GET_USER_FROM_SQL_BY_ID = "SELECT email, username, password, first_name, last_name, avatar_url FROM users WHERE user_id = ?";
	private static final String DELETE_USER_ACCOUNT = "DELETE FROM users WHERE email = ?";
	public List<String> users = new ArrayList<String>();

	private static UserDAO instance;
	private UserDAO(){}

	public static synchronized UserDAO getInstance(){
		if(instance == null){
			instance = new UserDAO();
		}
		return instance;
	}

	public void addProfilePic(User user) throws SQLException, UserException {
		if(user != null) {
			Connection connection = DBConnection.getInstance().getConnection();		  
			PreparedStatement ps = null;
			try {
				ps = connection.prepareStatement("UPDATE users SET avatar_url = ? WHERE user_id = ?");
				ps.setString(1, user.getPictureURL());
				ps.setLong(2, user.getUserID());
				ps.executeUpdate();
				ps.close();
			} catch (SQLException e) {
				System.out.println("Adding picture url failed!" + e.getMessage());
				throw e;
			}
		} else {
			throw new UserException();
		}

	}

	public synchronized boolean registerUser(User user) throws UserException {
		if(user != null) {
			Connection connection = DBConnection.getInstance().getConnection();

			try {
				PreparedStatement ps = connection.prepareStatement(INSERT_USER_SQL, Statement.RETURN_GENERATED_KEYS);
				ps.setString(1, user.getUsername());
				ps.setString(2, Encrypter.encrypt(user.getPassword()));
				ps.setString(3, user.getEmail());
				ps.setString(4, user.getFirstName());
				ps.setString(5, user.getLastName());
				ps.setString(6, null);

				ps.executeUpdate();

				ResultSet rs = ps.getGeneratedKeys();
				rs.next();
				user.setUserID(rs.getInt(1));
				new File("/Users/Ivan/Desktop/images/POSTS/"+user.getUserID()).mkdir();
				//new File("/Users/Mumko/Desktop/images/POSTS/"+user.getUserID()).mkdir();
				return true;

			} catch (SQLException e) {
				e.printStackTrace();
				throw new UserException("User cannot be registered now, please try again later!", e);

			}
		} else  {
			throw new UserException("User cannot be registered now, please try again later!");
		}
	}

	public boolean checkForUser(String email, String password) throws UserException {
		if((email != null && !email.equals("")) && password != null && !password.equals("")) {
			Connection connection = DBConnection.getInstance().getConnection();
			PreparedStatement ps = null;
			try {
				ps = connection.prepareStatement(SELECT_USER_SQL, Statement.RETURN_GENERATED_KEYS);
				ps.setString(1, email);
				ps.setString(2, Encrypter.encrypt(password));
				ps.executeQuery();
				ResultSet rs = ps.executeQuery();
				rs.next();
				return rs.getInt(1) > 0;
			} catch (SQLException e) {
				return false;
			}
		} else {
			throw new UserException("Email or password input is incorrect!");
		}
	}			

	public User getUser(String email) throws SQLException, UserException{
		if((email != null && !email.equals(""))){
			Connection con = DBConnection.getInstance().getConnection();
			PreparedStatement ps = con.prepareStatement(GET_USER_FROM_SQL);
			ps.setString(1, email);
			ResultSet rs = ps.executeQuery();
			rs.next();
	
			User user = new User(
					rs.getInt("user_id"), 
					rs.getString("username"), 
					rs.getString("password"), 
					rs.getString("first_name"),
					rs.getString("last_name"),
					rs.getString("avatar_url"));
	
			return user;
		} else {
			throw new UserException("Invalid input!");
		}
	}
	
	
	public User getUserBID(int userID) throws SQLException, UserException{
		if(userID > 0){
			Connection con = DBConnection.getInstance().getConnection();
			PreparedStatement ps = con.prepareStatement(GET_USER_FROM_SQL_BY_ID);
			ps.setInt(1, userID);
			ResultSet rs = ps.executeQuery();
			rs.next();
	
			User user = new User(
					rs.getString("username"), 
					rs.getString("email"), 
					rs.getString("first_name"),
					rs.getString("last_name")
			);
	
			return user;
		} else {
			throw new UserException("Invalid input!");
		}
	}

	public boolean checkForEmail(String email) throws UserException {
		if(email != null && !email.equals("")) {
			final String CHECK_FOR_EMAILS = "SELECT user_id from users WHERE email LIKE '"+ email + "%'";
			Connection connection = DBConnection.getInstance().getConnection();
			PreparedStatement ps;
			try {
				ps = connection.prepareStatement(CHECK_FOR_EMAILS, Statement.RETURN_GENERATED_KEYS);
				Statement stmt = connection.createStatement();
				ResultSet rs = stmt.executeQuery(CHECK_FOR_EMAILS);
				while (rs.next()) {
					return true;
				}
			} catch (SQLException e) {
				e.printStackTrace();
				throw new UserException();
			}
			return false;
		} else {
			throw new UserException("Invalid input!");
		}
	}

	public boolean checkForUsername(String username) throws UserException {
		if(username != null && !username.equals("")) {
		final String CHECK_FOR_EMAILS = "SELECT user_id from users WHERE username LIKE '"+ username + "%'";
		Connection connection = DBConnection.getInstance().getConnection();
		PreparedStatement ps;
		try {
			ps = connection.prepareStatement(CHECK_FOR_EMAILS, Statement.RETURN_GENERATED_KEYS);
			Statement stmt = connection.createStatement();
			ResultSet rs = stmt.executeQuery(CHECK_FOR_EMAILS);
			while (rs.next()) {
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
			throw new UserException();
		}

		return false;
		} else {
			throw new UserException("Invalid input!");
		}
	}

	public synchronized boolean deleteAccount (String email, String password) throws UserException {
		if((email != null && !email.equals("")) && password != null && !password.equals("")) {
		Connection connection = DBConnection.getInstance().getConnection();
		PreparedStatement ps = null;
		try {
			if(checkForUser(email, password)) {
				ps = connection.prepareStatement(DELETE_USER_ACCOUNT);
				ps.setString(1, email);
				ps.executeUpdate();
				//				if(checkForUser(email, password)) {
				//					System.err.println("Neshto ne se iztri");
				//					return false;
				//				}
				System.err.println("USER DELETED");
				return true;
			}
		} catch (UserException | SQLException e) {
			e.printStackTrace();
		}
		System.err.println("NO SUCH USER");
		return false;
		} else {
			throw new UserException("Invalid input!");
		}
	}

	public int getUserID(String email) throws UserException {
		if(email != null && !email.equals("")) {
		Connection connection = DBConnection.getInstance().getConnection();
		PreparedStatement ps = null;
		int id = 0;
		try {
			ps = connection.prepareStatement("SELECT user_id FROM users WHERE email = ?", Statement.RETURN_GENERATED_KEYS);
			ps.setString(1, email);
			ps.executeQuery();
			ResultSet rs = ps.executeQuery();
			rs.next();
			System.err.println("USER ID " + rs.getInt(1));
			id = rs.getInt(1);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return id;
		} else {
			throw new UserException("Invalid input!");
		}
	}

	public boolean changeFirstName (String name, int userID) throws UserException {
		if(name != null && !name.equals("")) {
		Connection connection = DBConnection.getInstance().getConnection();
		PreparedStatement ps = null;

		try {
			ps = connection.prepareStatement("UPDATE users SET first_name = ? WHERE user_id = ?");
			ps.setString(1, name);
			ps.setInt(2, userID);
			ps.executeUpdate();
			int result = ps.executeUpdate();
			if(result > 0) {
				System.err.println("USER FIRST NAME UPDATED");
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.err.println("NO SUCH USER");
		return false;
		} else {
			throw new UserException("Invalid input!");
		}
	}

	public boolean changeLastName (String name, int userID) throws UserException {
		if(name != null && !name.equals("") && (userID > 0)) {
		Connection connection = DBConnection.getInstance().getConnection();
		PreparedStatement ps = null;

		try {
			ps = connection.prepareStatement("UPDATE users SET last_name = ? WHERE user_id = ?");
			ps.setString(1, name);
			ps.setInt(2, userID);
			ps.executeUpdate();
			int result = ps.executeUpdate();
			if(result > 0) {
				System.err.println("USER LAST UPDATED");
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.err.println("NO SUCH USER");
		return false;
		} else {
			throw new UserException("Invalid input!");
		}
	}
		

	public boolean changeUsername (String username, int userID) throws UserException {
		if(username != null && !username.equals("") && (userID > 0)) {
		Connection connection = DBConnection.getInstance().getConnection();
		PreparedStatement ps = null;

		try {
			//da napravq proverka syshtestvuva li veche
			ps = connection.prepareStatement("UPDATE users SET username = ? WHERE user_id = ?");
			ps.setString(1, username);
			ps.setInt(2, userID);
			ps.executeUpdate();
			int result = ps.executeUpdate();
			if(result > 0) {
				System.err.println("USER USERNAME UPDATED");
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.err.println("NO SUCH USER");
		return false;
		} else {
			throw new UserException("Invalid input!");
		}
	}

	public boolean changeEmail (String email, int userID) throws UserException {
		if(email != null && !email.equals("") && (userID > 0)) {
		Connection connection = DBConnection.getInstance().getConnection();
		PreparedStatement ps = null;

		try {
			//da proverya syshtestvuva li emaila
			ps = connection.prepareStatement("UPDATE users SET email = ? WHERE user_id = ?");
			ps.setString(1, email);
			ps.setInt(2, userID);
			ps.executeUpdate();
			int result = ps.executeUpdate();
			if(result > 0) {
				System.err.println("USER EMAIL UPDATED");
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.err.println("NO SUCH USER");
		return false;
		} else {
			throw new UserException("Invalid input!");
		}
	}

	public boolean changePassword (String newPassword, int userID) throws UserException {
		if(newPassword != null && !newPassword.equals("") && (userID > 0)) {
		Connection connection = DBConnection.getInstance().getConnection();
		PreparedStatement ps = null;

		try {
			ps = connection.prepareStatement("UPDATE users SET password = ? WHERE user_id = ?");
			ps.setString(1, Encrypter.encrypt(newPassword));
			ps.setInt(2, userID);
			ps.executeUpdate();
			int result = ps.executeUpdate();
			if(result > 0) {
				System.err.println("USER PASSWORD UPDATED");
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.err.println("NO SUCH USER");
		return false;
		} else {
			throw new UserException("Invalid input!");
		}
	}

	public boolean changeAvatarURL (String URL, int userID) throws UserException {
		if(URL != null && !URL.equals("") && (userID > 0)) {
		Connection connection = DBConnection.getInstance().getConnection();
		PreparedStatement ps = null;

		try {
			ps = connection.prepareStatement("UPDATE users SET avatar_url = ? WHERE user_id = ?");
			ps.setString(1, URL);
			ps.setInt(2, userID);
			ps.executeUpdate();
			int result = ps.executeUpdate();
			if(result > 0) {
				System.err.println("USER AVATAR URL UPDATED " + URL);
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.err.println("NO SUCH USER");
		return false;
		} else {
			throw new UserException("Invalid input!");
		}
	}

	public User getTopUsers () throws UserException {
		System.err.println("V METODA SYM!!!!!!!!!!!!!!!!");
		Connection connection = DBConnection.getInstance().getConnection();
		User user = new User();
		Statement stmt = null;
		ResultSet rs = null;

		try {
			stmt = connection.createStatement();
			rs = stmt.executeQuery( "SELECT * FROM users ORDER BY avatar_url ASC" );
			System.err.println("V METODA SYM!!!!!!!!!!!!!!!!");
			while ( rs.next() || user.getPosts().size()<5) {
				//System.out.println("USER-A " + UserDAO.getInstance().getUser(rs.getString("email")));
				user.getPosts().add(UserDAO.getInstance().getUser(rs.getString("email")));
				//user.getPosts().add(rs.getString("user_pictureURL"));
				System.out.println("TUKA VLIZA LI IZOBSHTO " + rs.getString("email"));
			}		 			
		} catch (SQLException | UserException e) {
			e.printStackTrace();
			throw new UserException("Error in the DB");
		}
		return user;
	}


	public synchronized void followUser(int followerId, int followedId) {
		Connection connection = DBConnection.getInstance().getConnection();
		PreparedStatement ps = null;
		try {
			ps=connection.prepareStatement("INSERT INTO users_has_followers (user_id, users_follower_id) VALUES (?, ?)");
			ps.setInt(1, followedId);
			ps.setInt(2, followerId);
			ps.executeUpdate();
		} catch (SQLException e) {
			System.out.println("NE MOVE DA SE SLEDWA ");
			e.printStackTrace();
		}
	}



	public synchronized void unfollowUser(int followerId, int followedId){
		Connection connection = DBConnection.getInstance().getConnection();
		PreparedStatement ps = null;
		try {
			ps=connection.prepareStatement("DELETE FROM users_has_followers WHERE user_id=? AND users_follower_id=?");
			ps.setInt(1, followedId);
			ps.setInt(2, followerId);
			ps.executeUpdate();

		} catch (SQLException e) {
			System.out.println("NE MOVE DA SE Premahne SLEDWANE ");
			e.printStackTrace();
		}
	}


	public synchronized LinkedHashSet<User> getFollowers(User u) {
		Connection connection=DBConnection.getInstance().getConnection();
		PreparedStatement ps = null;
		LinkedHashSet<User> followers=new LinkedHashSet<>();
		try {

			System.out.println("Predi PS");
			ps=connection.prepareStatement("SELECT users.user_id, users.username, users.password, users.email, users.first_name, users.last_name, users.avatar_url FROM users JOIN users_has_followers ON users.user_id=users_has_followers.users_follower_id WHERE users_has_followers.user_id=?;");
			System.out.println("SLED PS");
			int id=u.getUserID();
			System.out.println(id+"ID to");
				
				
				ps.setInt(1,id);
		ResultSet rs=ps.executeQuery();
		
	
		while(rs.next()){
			System.out.println("W WHILE RS");
			
			followers.add(new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), 
					               rs.getString(6),  rs.getString(7)));
		}
		return followers;
		

		} catch (SQLException e) {
			System.out.println("NE MOVE DA SE VZEMAT POSLEDOVATELITE ");
			e.printStackTrace();
		}
		return followers;
	}
	
	
	public List<String> getUsers() {
		Connection connection = DBConnection.getInstance().getConnection();
		PreparedStatement ps = null;
		int id = 0;
		try {
			ps = connection.prepareStatement("SELECT first_name FROM users", Statement.RETURN_GENERATED_KEYS);
			//ps.setString(1, email);
			ps.executeQuery();
			ResultSet rs = ps.executeQuery();
			//rs.next();
			//System.err.println("USER ID " + rs.getInt(1));
			while(rs.next()){
				users.add(rs.getString("first_name"));
			}
			//id = rs.getInt(1);
		} catch (SQLException e) {
			e.printStackTrace();
		}
				
				
				return users;
	}

}

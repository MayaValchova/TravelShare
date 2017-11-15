package com.travelshare.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import org.springframework.stereotype.Component;

import com.travelshare.util.UserException;


@Component
public class EmotionDAO {

	private static final String ADD_EMOTION_SQL = "INSERT INTO emotions (emotion_type, user_id, post_id) VALUES (?,?,?)";
	private static final String CHECK_IF_USER_HAS_EMOTION_FOR_ALREADY = "SELECT emotion_id FROM emotions WHERE user_id = ? AND post_id = ?";
	private static final String COUNT_THE_NUMBER_OF_EMOTIONS = "SELECT COUNT(emotion_type) FROM emotions WHERE emotion_type = ? AND post_id = ?";

	private static EmotionDAO instance;
	private EmotionDAO(){}

	public static synchronized EmotionDAO getInstance(){
		if(instance == null){
			instance = new EmotionDAO();
		}
		return instance;
	}
	
	
	
	public int checkIfUserHasEmotion(int userID, int postID) throws UserException {		
		int emotionID = 0;;
		if(userID > 0) {
			Connection con = DBConnection.getInstance().getConnection();
			PreparedStatement ps;
			try {
				System.err.println("CHECKINNG FOR USER EMOTIONS");
				ps = con.prepareStatement(CHECK_IF_USER_HAS_EMOTION_FOR_ALREADY);
				ps.setInt(1, userID);
				ps.setInt(2, postID);
				ResultSet rs = ps.executeQuery();
				if(rs.next()) {
					emotionID = rs.getInt(1);
					System.err.println("Emotion FOUND " + emotionID);
				}
			} catch (SQLException e) {
				e.printStackTrace();
				throw new UserException("Error!", e);
			}
		} else {
			throw new UserException("Invalid userID!");
		}

		return emotionID;
	}


	public synchronized boolean addEmotion(int emotionType,int userID, int postID) throws UserException {

		if(userID > 0) {

			Emotion emotion = new Emotion();
			Connection connection = null;
			PreparedStatement ps = null;
			ResultSet rs = null;
			connection = DBConnection.getInstance().getConnection();

			if(checkIfUserHasEmotion(userID, postID) == 0) {
				System.err.println("USER HAS NO EMOTIONS");
				//ako nqma emociq update
				try {
					ps = connection.prepareStatement(ADD_EMOTION_SQL);
					ps.setInt(1, emotionType);
					ps.setInt(2, userID);
					ps.setInt(3, postID);
					ps.executeUpdate();
					int result = ps.executeUpdate();
					if(result > 0) {
						System.err.println("EMOTION ADDED");
						return true;
					}
					System.err.println("EMOTION NOT ADDED");
				} catch (SQLException e) {
					e.printStackTrace();
					throw new UserException("Error on Emotion change NEW EMOTION", e);
				}
			} 
			if(checkIfUserHasEmotion(userID, postID) > 0) {
				try {
					System.err.println("USER HAS AN EMOTION");
					ps = connection.prepareStatement("UPDATE emotions SET emotion_type = ? WHERE user_id = ? AND post_id = ?", Statement.RETURN_GENERATED_KEYS);
					ps.setInt(1, emotionType);
					ps.setInt(2, userID);
					ps.setInt(3, postID);

					ps.executeUpdate();

					rs = ps.getGeneratedKeys();
					rs.next();
					//emotion.setEmotionID((int)rs.getString("emotion_id"));
					System.err.println("EMOTION UPDATED");
					return true;
				} catch (SQLException e) {
					e.printStackTrace();
					System.err.println("EMOTION NOT UPDATED");
					throw new UserException("Error on Emotion change USER ALREADY HAS EMOTION", e);
				}
			}
		} else {
			throw new UserException("Invalid userID!");
		}

		return false;
	}

	public synchronized int countEmotions(int emotionType,int postID) throws UserException {
		int count = 0;
		
		if(emotionType > 0) {
			Connection con = DBConnection.getInstance().getConnection();
			PreparedStatement ps;
			ResultSet rs = null;
			try {
				ps = con.prepareStatement(COUNT_THE_NUMBER_OF_EMOTIONS);
				ps.setInt(1, emotionType);
				ps.setInt(2, postID);
				rs = ps.executeQuery();
				rs.next();
				count = rs.getInt(1);
			} catch (SQLException e) {
				e.printStackTrace();
				throw new UserException("Error trying to get the number of emotions!", e);
			}
		} else {
			throw new UserException("Invalid emotion type!");
		}	
		return count;
	}
	
}

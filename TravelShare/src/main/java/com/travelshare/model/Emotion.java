package com.travelshare.model;

public class Emotion {

	private int emotionID;
	private int emotionTypeID;
	
	
	private int postId;
	private int comentId;
	private int attachmentID;

	private int user_id;
	
	public Emotion() {}

	
	public Emotion(int emotionID, int emotionTypeID) {
		this.emotionID = emotionID;
		this.emotionTypeID = emotionTypeID;
	}



	public Emotion(int emotionTypeID, int postId, int user_id) {
		super();
		this.emotionTypeID = emotionTypeID;
		this.postId = postId;
		this.user_id = user_id;
	}



	public int getEmotionID() {
		return emotionID;
	}



	public void setEmotionID(int emotionID) {
		this.emotionID = emotionID;
	}



	public int getEmotionTypeID() {
		return emotionTypeID;
	}



	public void setEmotionTypeID(int emotionTypeID) {
		this.emotionTypeID = emotionTypeID;
	}



	public int getPostId() {
		return postId;
	}



	public void setPostId(int postId) {
		this.postId = postId;
	}



	public int getComentId() {
		return comentId;
	}



	public void setComentId(int comentId) {
		this.comentId = comentId;
	}



	public int getAttachmentID() {
		return attachmentID;
	}



	public void setAttachmentID(int attachmentID) {
		this.attachmentID = attachmentID;
	}



	public int getUser_id() {
		return user_id;
	}



	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	
	
	
	
}

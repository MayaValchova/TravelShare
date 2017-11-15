package com.travelshare.model;

import java.time.LocalDate;
import java.util.Date;

public class Attachment {

	private int attachmentID;
	private String title;
	private String description;
	private Date upload;
	private int postID;
	private String URL;
	
	public Attachment() {}
	
	public Attachment(int attachmentID, int postID, String URL) {
		super();
		this.attachmentID = attachmentID;
		this.postID = postID;
		this.URL = URL;
	}
	
	
	
	public Attachment(int attachmentID, String title, String description, Date upload, int postID, String uRL) {
		super();
		this.attachmentID = attachmentID;
		this.title = title;
		this.description = description;
		this.upload = upload;
		this.postID = postID;
		URL = uRL;
	}

	public int getAttachmentID() {
		return attachmentID;
	}
	public void setAttachmentID(int attachmentID) {
		this.attachmentID = attachmentID;
	}
	public int getPostID() {
		return postID;
	}
	public void setPostID(int postID) {
		this.postID = postID;
	}
	public String getURL() {
		return URL;
	}
	public void setURL(String uRL) {
		URL = uRL;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Date getUpload() {
		return upload;
	}

	public void setUpload(Date upload) {
		this.upload = upload;
	}
	
	
	
	
	
}

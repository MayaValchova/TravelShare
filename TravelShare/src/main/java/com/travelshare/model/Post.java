package com.travelshare.model;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;


public class Post {
	
		private int postId;
		private String title;
		private String location;
		private String description;	
		private int user_id;
		private int category_id;	
		private LocalDate upload;
		private LocalDate modify;		
		private List<Attachment> attachments;


		public Post(String title, String description, LocalDate a, LocalDate b,int category_id, int user_id, String location) {
			
			this.title = title;
			this.description = description;
			this.upload = a;
			this.modify = b;
			this.category_id = category_id;
			this.user_id =  user_id;
			this.location = location;
		}
		
	
		public Post() {
			attachments = new ArrayList<Attachment>();
		}


		public Post(String title, String location, String description) {

			this.title = title;
			this.location = location;
			this.description = description;
			
		}


		public String getLocation() {
			return location;
		}

		public void setLocation(String location) {
			this.location = location;
		}


//		public Post(String title, String description, LocalDateTime dateTime, User user, HashSet<Attachment> attachments,
//				HashSet<Coment> coments, Map<Emotion, Integer> emotions) {
//			this(title, description, dateTime, user);
//			this.attachments = attachments;
//			this.coments = coments;
//			this.emotions = emotions;
//		}



		public void setPostId(int post_id) {
			this.postId = post_id;
		}
		
		
		public int getPostId() {
			return postId;
		}

		public String getDescription() {
			return description;
		}



		public String getTitle() {
			return title;
		}



		public int getUser_id() {
			return user_id;
		}



		public int getCategory_id() {
			return category_id;
		}

		public List<Attachment> getAttachments() {
			return attachments;
	}
	//
//		public Set<Coment> getComents() {
//			return coments;
//		}
	//
//		public Map<Emotion, Integer> getEmotions() {
//			return emotions;
//		}

		
		

}

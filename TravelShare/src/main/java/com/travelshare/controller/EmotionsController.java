package com.travelshare.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.google.gson.Gson;
import com.travelshare.model.EmotionDAO;
import com.travelshare.util.UserException;

@Controller
public class EmotionsController {

	
	@RequestMapping(value="/about", method = RequestMethod.GET)
	public String aboutUs(Model model, HttpServletRequest request, HttpServletResponse response) {
		return "aboutUs";
			
	}
	
	@RequestMapping(value="/aboutUSS", method = RequestMethod.GET)
	public void about(Model model, HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		//if(request.getSession().getId() != null) {
		int numberOfEmotions = 0;
		String emotoion = request.getParameter("emotionType");
		int emotionID = Integer.valueOf(emotoion);
		String post = request.getParameter("postID");
		int postID = Integer.valueOf(post);
	//	System.err.println("request for SQL EMOTION UPDATE " + emotionID + " " + session.getAttribute("userID") + " " + request.getParameter("postID"));
		try {
			EmotionDAO.getInstance().addEmotion(emotionID,(int)session.getAttribute("userID"),postID);
		} catch (UserException e1) {
			e1.printStackTrace();
		}
		//System.err.println("request for SQL EMOTION UPDATE " + emotionID + " " + session.getAttribute("userID") + " " + session.getAttribute("postID"));

		response.setContentType("text/json");
		response.setCharacterEncoding("UTF-8");
		
		String username = request.getParameter("user");
		try {
			numberOfEmotions = EmotionDAO.getInstance().countEmotions(emotionID, postID);
		} catch (UserException e1) {
			e1.printStackTrace();
		}
		List<Integer> list = new ArrayList<Integer>();
		list.add(numberOfEmotions);
			try {
				if (list != null ) {
				PrintWriter p =  response.getWriter();
				System.out.println(new Gson().toJson(list));
				response.getWriter().print(new Gson().toJson(list));
			} else {
				response.getWriter().print("[]");
			}	
			} catch (IOException e) {
				e.printStackTrace();
			}
//		}else {
//			request.getSession().invalidate();
//			return "login";
//		}
			
	}
	
	
}

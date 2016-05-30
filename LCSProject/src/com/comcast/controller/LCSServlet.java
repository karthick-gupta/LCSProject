package com.comcast.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONException;

import com.comcast.customexceptions.EmptyInputList;
import com.comcast.customexceptions.NonUniqueInputList;
import com.comcast.custommessages.CustomMessages;
import com.comcast.service.LongestCommonSubString;

public class LCSServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		System.out.println("Inside HttpServlet doPost Method");

		String source = (String) request.getParameter("jsonData");
		
		String lcsString = null;
		
		try {
			lcsString = CustomMessages.SUCCESS + " \"" + LongestCommonSubString.parseRequest(source) + "\"";
		}  catch (EmptyInputList e) {
			response.setStatus(400);
			lcsString = CustomMessages.EMPTY_LIST;
		}  catch (NonUniqueInputList e) {
			response.setStatus(400);
			lcsString = CustomMessages.NON_UNIQUE_LIST;
		} catch (Exception e) {
			response.setStatus(400);
			lcsString = CustomMessages.INCORRECT_JSON;
		}

		request.setAttribute("lcsString", lcsString);
		RequestDispatcher rd = request.getRequestDispatcher("ResultPage.jsp");
		rd.forward(request, response);

	}

}

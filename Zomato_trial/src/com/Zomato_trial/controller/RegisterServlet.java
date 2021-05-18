package com.Zomato_trial.controller;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Zomato_trial.Dao.RegisterDao;
import com.Zomato_trial.bean.RegisterBean;

public class RegisterServlet extends HttpServlet{

	protected void doPost(HttpServletRequest request,HttpServletResponse response) {
	
		String userEmail=request.getParameter("username");
		String password=request.getParameter("password");
		String phone=request.getParameter("phone");
		String address=request.getParameter("address");
		String name=request.getParameter("name");
		String city=request.getParameter("city");
		String state=request.getParameter("state");
		int pincode=Integer.parseInt(request.getParameter("pincode"));
		
		RegisterBean registerbean = new RegisterBean();
		
		registerbean.setUserEmail(userEmail);
		registerbean.setPassword(password);
		registerbean.setPhone(phone);
		registerbean.setAddress(address);
		registerbean.setName(name);
		registerbean.setCity(city);
		registerbean.setState(state);
		registerbean.setPincode(pincode);
		
		RegisterDao registerDao=new RegisterDao();
		
		int insertData=registerDao.insertUser(registerbean);
		
		if(insertData != 0)
		{
			try {
				HttpSession session = request.getSession();
				session.setAttribute("user_id", insertData);
				
				//System.out.println(userValidate);

				//request.setAttribute("userName", userName);
				request.getRequestDispatcher("jsp/home.jsp").forward(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else
		{
			try {
				request.getRequestDispatcher("jsp/register.jsp").forward(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
	}
	
}

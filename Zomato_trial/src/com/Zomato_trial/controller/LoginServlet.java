package com.Zomato_trial.controller;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Zomato_trial.Dao.LoginDao;
import com.Zomato_trial.bean.LoginBean;

public class LoginServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) {

		String userName = request.getParameter("username");
		String password = request.getParameter("password");

		LoginBean loginBean = new LoginBean();

		loginBean.setUserName(userName);
		loginBean.setPassword(password);

		LoginDao loginDao = new LoginDao();

		int userValidate = loginDao.authenticateUser(loginBean);

		if (userValidate != 0) {
			try {
				HttpSession session = request.getSession();
				session.setAttribute("user_id", userValidate);
				
				//System.out.println(userValidate);

				request.setAttribute("userName", userName);
				request.getRequestDispatcher("jsp/home.jsp").forward(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			try {
				request.getRequestDispatcher("jsp/login.jsp").forward(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

	}

}

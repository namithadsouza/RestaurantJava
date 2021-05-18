package com.Zomato_trial.controller;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Zomato_trial.Dao.PlaceOrderDao;
import com.Zomato_trial.bean.PlaceOrderBean;

public class PlaceOrderServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) {

		String name = request.getParameter("name");
		String address = request.getParameter("address");
		String city = request.getParameter("city");
		String phone = request.getParameter("phone");
		int pincode = Integer.parseInt(request.getParameter("pincode"));

		HttpSession session = request.getSession();
		int u_id = (int) session.getAttribute("user_id");

		PlaceOrderBean placeorderbean = new PlaceOrderBean();

		placeorderbean.setName(name);
		placeorderbean.setAddress(address);
		placeorderbean.setCity(city);
		placeorderbean.setPhone(phone);
		placeorderbean.setPincode(pincode);
		placeorderbean.setU_id(u_id);

		System.out.println(name);
		PlaceOrderDao placeorderdao = new PlaceOrderDao();

		int updateorder = placeorderdao.updateOrder(placeorderbean);

		if (updateorder != 0) {
			try {
				request.getRequestDispatcher("jsp/home.jsp").forward(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			try {
				request.getRequestDispatcher("jsp/place_order.jsp").forward(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
}
package com.Zomato_trial.controller;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Zomato_trial.Dao.OrderCartDao;
import com.Zomato_trial.bean.OrderCartBean;

public class OrderCartServlet extends HttpServlet{

	protected void doPost(HttpServletRequest request,HttpServletResponse response) {
		
		int qty=Integer.parseInt(request.getParameter("qty"));
		
		HttpSession session=request.getSession();
		int f_id=(int)session.getAttribute("f_id");
		int u_id=(int)session.getAttribute("user_id");

		//System.out.println("f_id:"+f_id);
		//System.out.println("QTY:"+qty);
	
		
		OrderCartBean ordercartbean=new OrderCartBean();
		
		ordercartbean.setQty(qty);
		ordercartbean.setF_id(f_id);
		ordercartbean.setU_id(u_id);
		
		OrderCartDao ordercartdao=new OrderCartDao();
		
		int n=ordercartdao.addToCart(ordercartbean);
		
		if(n!=0) {
			try {
				request.getRequestDispatcher("jsp/cart.jsp").forward(request, response);
				request.setAttribute("alertMsg", "data add sucessfully");
				request.getRequestDispatcher("jsp/success.jsp").include(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else {
			System.out.println("Error");
		}
		
	}
}

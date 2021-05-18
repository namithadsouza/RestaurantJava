package com.Zomato_trial.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.Zomato_trial.bean.PlaceOrderBean;
import com.Zomato_trial.connection.Connect;

public class PlaceOrderDao {

	public int updateOrder(PlaceOrderBean placeorderbean) {
		
		String name=placeorderbean.getName();
		String address=placeorderbean.getAddress();
		String city=placeorderbean.getCity();
		String phone=placeorderbean.getPhone();
		int pincode=placeorderbean.getPincode();
		int user_id=placeorderbean.getU_id();
		
		Connection con = null;
		PreparedStatement ps = null;
		Statement statement=null;
		ResultSet resultSet = null;
		int n=0,p=0;
		
		try {
			con=Connect.getConnection();
			
			ps = con.prepareStatement("select order_id,order_amount from orders where user_id=? and order_status=?");
			ps.setInt(1, user_id);
			ps.setString(2, "pending");
			resultSet = ps.executeQuery();
			while(resultSet.next()) {
				
				int order_id=resultSet.getInt("order_id");
				int order_amount=resultSet.getInt("order_amount");
				System.out.println("bbb "+city);

				ps=con.prepareStatement("insert into delivery(name,address,city,phone,pincode,order_id,order_amount,user_id) values(?,?,?,?,?,?,?,?)");
				ps.setString(1, name);
				ps.setString(2, address);
				ps.setString(3, city);
				ps.setString(4, phone);
				ps.setInt(5, pincode);
				ps.setInt(6, order_id);
				ps.setInt(7, order_amount);
				ps.setInt(8, user_id);
				
				n=ps.executeUpdate();
				System.out.println("ccc "+city);

				ps=con.prepareStatement("update orders set order_status=? where user_id=? and order_status=?");
				ps.setString(1, "order recieved");
				ps.setInt(2, user_id);
				ps.setString(3, "pending");
				p=ps.executeUpdate();
				System.out.println("ddd "+city);

				if(n!=0 && p!=0) {
					return 1;
				}else {
					return 0;
				}
			}
			
			
		}catch (Exception e) {
			e.printStackTrace();
		}

		
		
		return 0;
		
	}
	
}

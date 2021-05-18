package com.Zomato_trial.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.http.HttpSession;

import com.Zomato_trial.bean.OrderCartBean;
import com.Zomato_trial.connection.Connect;

public class OrderCartDao {
	
	public int addToCart(OrderCartBean ordercartbean) {
		
		int f_id=ordercartbean.getF_id();
		int u_id=ordercartbean.getU_id();
		int qty=ordercartbean.getQty();
		
		Connection con = null;
		PreparedStatement ps = null;
		Statement statement=null;
		ResultSet resultSet = null;
		int n=0,total=0;
		
		try {
			con=Connect.getConnection();
			
			ps = con.prepareStatement("select f_price from food_item where f_id=?");
			ps.setInt(1, f_id);
			resultSet = ps.executeQuery();
			while(resultSet.next()) {
				int f_price=resultSet.getInt("f_price");
				total=f_price*qty;
				
				ps=con.prepareStatement("insert into orders(f_id,order_qty,user_id,order_amount) values(?,?,?,?)");
				ps.setInt(1, f_id);
				ps.setInt(2, qty);
				ps.setInt(3, u_id);
				ps.setInt(4, total);
				
				n=ps.executeUpdate();
				
				if(n!=0) {
					return 1;
				}else {
					return 0;
				}
			}
			
			
		}catch (SQLException e) {
			e.printStackTrace();
		}

		
		
		return 0;
	}

}

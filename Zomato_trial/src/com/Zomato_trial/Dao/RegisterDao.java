package com.Zomato_trial.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.Zomato_trial.bean.RegisterBean;
import com.Zomato_trial.connection.Connect;

public class RegisterDao {

	public int insertUser(RegisterBean registerBean) {
		String userEmail = registerBean.getUserEmail();
		String password = registerBean.getPassword();
		String phone = registerBean.getPhone();
		String address = registerBean.getAddress();
		String name = registerBean.getName();
		String city = registerBean.getCity();
		String state = registerBean.getState();
		int pincode = registerBean.getPincode();

		Connection con = null;
		PreparedStatement ps = null;
		Statement statement=null;
		ResultSet resultSet = null;
		int n=0,p=0;

		try {
			con = Connect.getConnection();
			// statement = con.createStatement();
			// int num = statement.executeUpdate("insert into
			// register(user_email,phone_number,address) values(?,?,?)");;

			ps = con.prepareStatement("insert into register(user_email,phone_number,address,name,city,state,pincode) values(?,?,?,?,?,?,?)");
			ps.setString(1, userEmail);
			ps.setString(2, phone);
			ps.setString(3, address);
			ps.setString(4, name);
			ps.setString(5, city);
			ps.setString(6, state);
			ps.setInt(7, pincode);

			n = ps.executeUpdate();
			
			if(n!=0) {
				//statement = con.createStatement();
				//resultSet = statement.executeQuery("select user_id from register where user_email=?");
				ps = con.prepareStatement("select user_id from register where user_email=?");
				ps.setString(1, userEmail);
				resultSet = ps.executeQuery();
				while(resultSet.next()) {
					int uid=resultSet.getInt("user_id");
					ps = con.prepareStatement("insert into login(user_id,user_email,password) values(?,?,?)");
					ps.setInt(1, uid);
					ps.setString(2, userEmail);
					ps.setString(3, password);
					p=ps.executeUpdate();
					if(p!=0) {
						return uid;
					}
				}
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return 0;
	}

}

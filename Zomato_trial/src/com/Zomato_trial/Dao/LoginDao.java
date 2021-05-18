package com.Zomato_trial.Dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.Zomato_trial.bean.LoginBean;
import com.Zomato_trial.connection.Connect;

public class LoginDao {
	
	public int authenticateUser(LoginBean loginBean)
	{
		
		String userName=loginBean.getUserName();
		String password=loginBean.getPassword();
		
		Connection con=null;
		Statement statement=null;
		ResultSet resultSet = null;
		
		try
		{
			con=Connect.getConnection();
			statement= con.createStatement();
			resultSet = statement.executeQuery("select * from login");
			
			while(resultSet.next())
			{
				String user=resultSet.getString("user_email");
				String pass=resultSet.getString("password");
				int user_id = resultSet.getInt("user_id");
				
				if(userName.equals(user) && password.equals(pass))
				{
					return user_id;
				}
			}
		}catch(SQLException e)
			{
				e.printStackTrace();
			}
			
			return 0;
			
		
	}

}

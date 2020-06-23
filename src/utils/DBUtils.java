package utils;

import java.sql.*;

public class DBUtils {

	private String url = "jdbc:mysql://192.168.168.1:3306/ICMS?useUnicode=true&characterEncoding=utf8&serverTimezone=GMT%2B8&useSSL=false";

	private String user = "root";

	private String password = "abc1234";

	private Connection conn = null;
	
	private PreparedStatement stmt = null;

	private ResultSet rs = null;

	static {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	private void getConnect() {
		try {
			conn = DriverManager.getConnection(url, user, password);

		} catch (SQLException e) {

			e.printStackTrace();
		}

	}


	public int doUpdate(String Sqls, Object[] params) {

		getConnect();
		int i=0;
		try {

			stmt = conn.prepareStatement(Sqls);

			if (params!=null && params.length!=0) {
				for (int j = 0; j < params.length; j++) {
					stmt.setObject(j+1, params[j]);
				}
			}

			i = stmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return i;
	}

	public ResultSet doQuery(String Sqls, Object[] params) {

		getConnect();
		try {
			stmt = conn.prepareStatement(Sqls);

			if (params!=null && params.length!=0) {
				for (int j = 0; j < params.length; j++) {
					stmt.setObject(j+1, params[j]);
				}
			}

			rs = stmt.executeQuery();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
	}


	public void getClose() {
		 try {
			if (rs!=null) {
				rs.close();
			}
			if (stmt!=null) {
				stmt.close();
			}
			if (conn!=null) {
				conn.close();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
 
	
}

 
package members;

import java.sql.*;

public class memberDAO {
	int checkId = 0;
    public int logincheck(String membersid) {
	try{

		
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection(
				"jdbc:mysql://localhost/underground","root","0000");
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(
				"select * from members where membersid = ?");
		        if(rs.next() || membersid.equals("")){			
		        	checkId = 0;
				} else{
					checkId = 1;
				}
	}catch(Exception e){
		e.printStackTrace();
	}
	return -1;
	
	
	
	
}
}
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%!
	Connection connection;//DB 접속연결에 관한 객체
	Statement statement;//query에 관한 객체
	ResultSet resultSet;//query에 대한 결과가 저장되는 객체
	
	String driver ="oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String uid = "scott";
	String upw = "tiger";
	String query ="select * from member";

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>memberDB.jsp</title>
</head>
<body>
	<%
		try{
			
			Class.forName(driver);
			connection = DriverManager.getConnection(url, uid, upw);
			statement = connection.createStatement();
			resultSet = statement.executeQuery(query);
			
			while(resultSet.next()){
				String id = resultSet.getString("id");
				String pw = resultSet.getString("pw");
				String name = resultSet.getString("name");
				String phone = resultSet.getString("phone");
				
				out.println("아이디 :" + id + "<br/>");
				out.println("비밀번호 :" + pw + "<br/>");
				out.println("이름 :" + name + "<br/>");
				out.println("전화번호 :" + phone + "<br/>");
				out.println("=====================================<br/>");				
				
			}
			
		} catch(Exception e) {
			
		} finally {
			try {
				if(resultSet != null) resultSet.close();
				if(statement != null) statement.close();
				if(connection != null) connection.close();
			} catch(Exception e) {
				
			}
		}
		
	
	
	%>
</body>
</html>
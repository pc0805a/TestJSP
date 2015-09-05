<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%!final String USER = "root";
	final String PASS = "ccw820605";
	final String DB_URL = "jdbc:mysql://localhost:3306/?useUnicode=true&characterEncoding=utf-8";
	final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
	//建立一個聯結物件 
	Connection conn;
	//建立Statement物件，建立陳述式物件 
	Statement stmt;
	%>
<%
	try {
		Class.forName(JDBC_DRIVER);
		conn = DriverManager.getConnection(DB_URL, USER, PASS);
		stmt = conn.createStatement();

	} catch (ClassNotFoundException e) {
		// TODO Auto-generated catch block
		out.println("ClassNotFoundException : " + e); 
		e.printStackTrace();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
		out.println("SQL Exception : " + e); 

	}
%>

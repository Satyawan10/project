<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%@page import="java.sql.*"%>
<%

	String id = request.getParameter("id");
	Connection connection;
	PreparedStatement preparedStatement;
	ResultSet resultSet;

	Class.forName("com.mysql.jdbc.Driver");
	connection = DriverManager.getConnection("jdbc:mysql://localhost:3306?user=root&password=root");
	preparedStatement = connection
	.prepareStatement("delete from students.details where id=?");
	preparedStatement.setString(1, id);
	preparedStatement.executeUpdate();
	
%>

<script>
	alert("Record Delete");
</script>


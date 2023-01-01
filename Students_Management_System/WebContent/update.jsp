<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@page import="java.sql.*"%>
	
<%
if (request.getParameter("submit") != null) {
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	String branch = request.getParameter("branch");
	String email = request.getParameter("email");
	long contact = Long.parseLong(request.getParameter("contact"));
	String location = request.getParameter("location");

	Connection connection;
	PreparedStatement preparedStatement;
	ResultSet resultSet;

	Class.forName("com.mysql.jdbc.Driver");
	connection = DriverManager.getConnection("jdbc:mysql://localhost:3306?user=root&password=root");
	preparedStatement = connection
	.prepareStatement("update students.details set name=?, branch=?, email=?, contact=?, location=? where id=?");
	preparedStatement.setString(1, name);
	preparedStatement.setString(2, branch);
	preparedStatement.setString(3, email);
	preparedStatement.setLong(4, contact);
	preparedStatement.setString(5, location);
	preparedStatement.setString(6,id);
	preparedStatement.executeUpdate();
%>

<script>
	alert("Record Update");
</script>

<%
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Page</title>
<style type="text/css">

.container {
	height: 100vh;
	width: 100vw;
	display: flex;
	justify-content: center;
	align-items: center;
	background-image:
		url("https://img.freepik.com/free-photo/abstract-luxury-gradient-blue-background-smooth-dark-blue-with-black-vignette-studio-banner_1258-63495.jpg?w=360");
	background-position: center;
	background-repeat: no-repeat;
	background-size: cover;
	background-repeat: no-repeat;
}

.card {
	width: auto;
	border: 1px solid #e2e2e2;
	border-radius: 3px;
	background: #f7f7f7;
	padding: 10px;
	font-family: Poppins ', sans-serif;
	background-color: #D3D3D3
}

h1 {
	color: navy;
	background-color: #FFCCCB;
}

input[type="text"], input[type="number"], input[type="email"]
	{
	width: 80%;
	padding: 10px;
	margin-top: 10px;
	outline: none;
	border: 1 px solid #e2e2e2;
	border-radius: 3px;
	font-family: Poppins ', sans-serif;
}

#reset {
	background-color: #f0222c;
	align-content: flex-start;
}

#submit {
	background-color: #1e66d9;
	position: right;
}

#reset:hover {
	cursor: pointer;
	background-color: #db1f28;
	color: white;
}

#submit:hover {
	cursor: pointer;
	background-color: #1e66d9;
	color: white;
}


</style>

</head>
<body>


	<div class="container">


		<div class="card">

			<form action="#" method="post" >
				<h1>
					<b>STUDENTS REGISTRATION</b>
				</h1>
				<br>
				<%
				Connection connection;
				PreparedStatement preparedStatement;
				ResultSet resultSet;

				Class.forName("com.mysql.jdbc.Driver");
				connection = DriverManager.getConnection("jdbc:mysql://localhost:3306?user=root&password=root");
				String id = request.getParameter("id");

				preparedStatement = connection.prepareStatement("select * from students.details where id=?");
				preparedStatement.setString(1, id);
				resultSet = preparedStatement.executeQuery();

				while (resultSet.next()) {
				%>


				<div>
					<label class="form-label"><b>Student Name</b></label><br> <input
						type="text" class="form-control" placeholder="Enter Student Name"
						name="name" id="name" value="<%=resultSet.getString("name") %>" required="required">
				</div>

				<div>
					<label class="form-label"><b>Branch</b></label><br> <input
						type="text" class="form-control" placeholder="Enter Branch"
						name="branch" value="<%=resultSet.getString("branch") %>" id="branch" required="required">
				</div>

				<div>
					<label class="form-label"><b>Email</b></label><br> <input
						type="email" class="form-control" placeholder="Enter Email"
						name="email" value="<%=resultSet.getString("email") %>" id="email" required="required">
				</div>

				<div>
					<label class="form-label"><b>Contact</b></label><br> <input
						type="number" class="form-control" placeholder="Enter Contact"
						name="contact" value="<%=resultSet.getLong("contact") %>" id="contact" required="required">
				</div>

				<div>
					<label class="form-label"><b>Location</b></label><br> <input
						type="text" class="form-control" placeholder="Enter location"
						name="location" value="<%=resultSet.getString("location") %>" id="location" required="required">
				</div>

				<%
				}
				%>
				<br>

				<div>

					<input type="reset" id="reset" value="reset" name="reset"
						class="reset">&nbsp; <input type="submit" id="submit"
						value="submit" name="submit" class="submit"
						style="position: right;">
				</div>

		<div align="right">
					<p>
						<a href="index.jsp">Click Back</a>
					</p>

				</div>
			</form>
		</div>
	</div>
</body>
</html>
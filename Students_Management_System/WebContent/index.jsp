<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
if (request.getParameter("submit") != null) {
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
	.prepareStatement("insert into students.details(name,branch,email,contact,location) values(?,?,?,?,?)");
	preparedStatement.setString(1, name);
	preparedStatement.setString(2, branch);
	preparedStatement.setString(3, email);
	preparedStatement.setLong(4, contact);
	preparedStatement.setString(5, location);
	preparedStatement.executeUpdate();
%>

<script>
	alert("Record Added");
</script>

<%
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Index Page</title>


<style type="text/css">
table, tr, th, td {
	border: 1px solid black;
	border-collapse: collapse;
	width: 90vw;
	text-align: center;
	background-color: #ADD8E6;
}

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

.submitForm {
	background-position: center;
}

input[type="text"], input[type="number"], input[type="email"] {
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

.containers {
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

.cards {
	width: 90vw;
	height: auto;
	border: 1px solid #e2e2e2;
	border-radius: 3px;
	background: #f7f7f7;
	padding: 10px;
	font-family: Poppins ', sans-serif;
	border: 1px solid #e2e2e2;
}

.cards h1 {
	background-color: #FFCCCB;
}
</style>
</head>
<body>
	<div class="container">
		<div class="card">
			<form action="#" method="post" class="submitForm">
				<h1>
					<b>STUDENTS REGISTRATION</b>
				</h1>
				<br>
				<div>
					<label class="form-label"><b>Student Name</b></label><br> <input
						type="text" class="form-control" placeholder="Enter Student Name"
						name="name" id="name" required="required">
				</div>
				<div>
					<label class="form-label"><b>Branch</b></label><br> <input
						type="text" class="form-control" placeholder="Enter Branch"
						name="branch" id="branch" required="required">
				</div>
				<div>
					<label class="form-label"><b>Email</b></label><br> <input
						type="email" class="form-control" placeholder="Enter Email"
						name="email" id="email" required="required">
				</div>
				<div>
					<label class="form-label"><b>Contact</b></label><br> <input
						type="number" class="form-control" placeholder="Enter Contact"
						name="contact" id="contact" required="required">
				</div>
				<div>
					<label class="form-label"><b>Location</b></label><br> <input
						type="text" class="form-control" placeholder="Enter location"
						name="location" id="location" required="required">
				</div>
				<br>
				<div>
					<input type="reset" id="reset" value="reset" name="reset"
						class="reset">&nbsp; <input type="submit" id="submit"
						value="submit" name="submit" class="submit"
						style="position: right;">
				</div>
			</form>
		</div>
	</div>
	<div class="containers">
		<div class="cards" align="center" style="text-align: center;">

			<h1 style="color: navy;">STUDENTS DETAILS</h1>

			<table id="tbl-students" class="table">
				<thead>
					<tr>
						<th><b>Student Name</b></th>
						<th><b>Branch</b></th>
						<th><b>Email</b></th>
						<th><b>Contact</b></th>
						<th><b>Location</b></th>
						<th><b>Edit</b></th>
						<th><b>Delete</b></th>

					</tr>
					<%
					Connection connection;
					PreparedStatement preparedStatement;
					ResultSet resultSet;

					Class.forName("com.mysql.jdbc.Driver");
					connection = DriverManager.getConnection("jdbc:mysql://localhost:3306?user=root&password=root");

					Statement statement = connection.createStatement();

					resultSet = statement.executeQuery("select * from students.details");

					while (resultSet.next()) {
						String id = resultSet.getString("id");
					%>
					<tr>

						<td><%=resultSet.getString("name")%></td>
						<td><%=resultSet.getString("branch")%></td>
						<td><%=resultSet.getString("email")%></td>
						<td><%=resultSet.getLong("contact")%></td>
						<td><%=resultSet.getString("location")%></td>
						<td><a href="update.jsp?id=<%=id%>">Edit</a></td>
						<td><a href="delete.jsp?id=<%=id%>">Delete</a></td>

					</tr>

					<%
					}
					%>
				</thead>
			</table>
		</div>
	</div>
</body>
</html>
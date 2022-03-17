<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login Successful</title>
</head>
<body>
	<%
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
		
		if(session.getAttribute("uname")==null)
		{
			response.sendRedirect("Login.jsp");
		}
	%>
	<form action="NameSearch" method="post">
		Enter ID: <input type="text" name="id"><br>
		<input type="submit" value="Search">	
	</form>
	
	<h3>Update Salary Details</h3>
	<br>
	 <table style="with: 80%">
    <tr>
     <td>UserName</td>
     <td><input type="text" name="username" /></td>
    </tr>
    <tr>
     <td>Job Role</td>
     <td><input type="text" name="jobrole" /></td>
    </tr>
   <tr>
     <td>Salary</td>
     <td><input type="text" name="salaryy" /></td>
    </tr>
    <tr>
     <td>Bonus</td>
     <td><input type="text" name="bonus" /></td>
    </tr>
   </table>
   
   <form action="details" method="post">
    <input type="submit" value="Submit" />
   </form>
   
	<br>
	<form action="Logout" method="post">
		<input type="submit" value="Log Out">	
	</form>
</body>
</html>
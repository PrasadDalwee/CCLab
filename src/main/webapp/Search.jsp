<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import= "java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Search Results</title>
</head>
<body>
	<H1 >Report</H1>
	<br>
		<H2>Personal Information</H2>
	<%
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
		
		if(session.getAttribute("uname")==null)
		{
			response.sendRedirect("Login.jsp");
		}
	%>
	<% 
		String url="jdbc:mysql://localhost:3306/cc";
		String username ="root";
		String password ="my123sql";
		
		String query1="select ID,firstname,lastname,dob,contact from PrasadDalwee_111915092_detail where ID =?;";
		
		//String id="s";
		String id=(String) session.getAttribute("id");

		try 
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con =DriverManager.getConnection(url,username,password);
			
			PreparedStatement st1= con.prepareStatement(query1);
			st1.setString(1, id );
			ResultSet rs1 =st1.executeQuery();
			
			if(!rs1.next())
			{	out.println("ID not found\n");}
			
			else
			{
			%>
				<Table border=1>
				<tr> 
					<TH>ID</TH><TH>First Name</TH> <TH>Last Name</TH><TH>DOB</TH><TH>Contact No.</TH> 
				</tr>
				
				<tr> 
						<td> <%=rs1.getString(1) %></td> <td><%=rs1.getString(2) %> </td>
						<td><%=rs1.getString(3) %> </td> <td><%=rs1.getString(4) %> </td>
						<td><%=rs1.getString(5) %> 
						
					
				</tr>
				</Table>
				<br>
				<H2>Salary Information</H2>
			
			<%} }
		
				catch (Exception e) 
				{
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			%>
	<% 

		String query2="select jobrole,salary,bonus from PrasadDalwee_111915092_salary where ID =?;";

		try 
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con =DriverManager.getConnection(url,username,password);
			
			PreparedStatement st2= con.prepareStatement(query2);
			st2.setString(1, id );
			ResultSet rs2 =st2.executeQuery();
			
			if(!rs2.next())
			{	out.println("ID not found\n");}
			
			else
			{
				int salary=rs2.getInt(2);
				int bonus=rs2.getInt(3);
				salary=(salary*12)+bonus;
			%>
				<Table border=1>
				<tr> 
					<TH>Job Role</TH><TH>Monthly Salary</TH> <TH>Bonus</TH><TH>Annual Salary</TH>
				</tr>
				
				<tr> 
						<td> <%=rs2.getString(1) %></td> <td><%=rs2.getString(2) %> </td>
						<td><%=rs2.getString(3) %> </td> <td><%=salary %> </td>
						
					
				</tr>
				</Table>
				<br>
			<%} }
		
				catch (Exception e) 
				{
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			%>
			
	<form action="Logout" method="post">
		<input type="submit" value="Log Out">	
	</form>

</body>
</html>
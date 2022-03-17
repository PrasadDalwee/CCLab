package classpackage;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;




@WebServlet("/signup")

public class signup extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private EmployeeDao employeeDao;
	
	public void init() {
		employeeDao = new EmployeeDao();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		
		
		String address = request.getParameter("address");
		String contact = request.getParameter("contact");
		String jobrole = request.getParameter("jobrole");
		Integer salaryy=Integer.parseInt(request.getParameter("salaryy"));
		Integer bonus=Integer.parseInt(request.getParameter("salaryy"));
		
		
	    
		
		Employee employee = new Employee();
		employee.setUsername(username);
		employee.setPassword(password);
		employee.setFirstName(firstName);
		employee.setLastName(lastName);
		employee.setAddress(address);
		
		employee.setContact(contact);
		employee.setJob(jobrole);
		employee.setSalary(salaryy);
		employee.setBonus(bonus);
		
		try {
			employeeDao.registerEmployee(employee);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		response.sendRedirect("Login.jsp");
	}
}
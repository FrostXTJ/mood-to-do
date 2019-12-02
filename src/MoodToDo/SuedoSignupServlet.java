package MoodToDo;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import general.User;

/**
 * Servlet implementation class SuedoSignupServlet
 */
@WebServlet("/SuedoSignupServlet")
public class SuedoSignupServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SuedoSignupServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username-input");
		String password = request.getParameter("password-input-1");
		String confirmPassword = request.getParameter("password-input-2");
		String nextPage = "/index.jsp";
		String errMsg = "";
		
		try {
			HttpSession session = request.getSession(false);
			if (session != null) {
				session.invalidate();
			}
			
			// Validate if the username or password is empty.
			if (username == null || username == "") {
				errMsg = "Username cannot be empty.";
				nextPage = "/RegisterPage.jsp";
			} else if (password == null || password == "") {
				errMsg = "Password cannot be empty.";
				nextPage = "/RegisterPage.jsp";
			} else if (confirmPassword == null || confirmPassword == "") {
				errMsg = "Please confirm your password.";
				nextPage = "/RegisterPage.jsp";	
			} else if (!password.equals(confirmPassword)){
				// Validate if two passwords match
				errMsg = "The passwords do not match.";
				nextPage = "/RegisterPage.jsp";
			} else {
				User user = new User(username, password);
				session = request.getSession(true);
				session.setAttribute("user", user);
				System.out.println("New user successfully created.");
			}
			
		} finally {
			request.setAttribute("errorMessage", errMsg);
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(nextPage);
			dispatcher.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

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
 * Servlet implementation class SuedoLoginServlet
 */
@WebServlet("/SuedoLoginServlet")
public class SuedoLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SuedoLoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username-input");
		String password = request.getParameter("password-input");
		String nextPage = "/index.jsp";
		String errMsg = "";
		

		try {
			HttpSession session = request.getSession(false);
			System.out.println("Logout from previous session.");
			if (session != null) {
				session.invalidate();
			}
			
			// Validate if the username or password is empty.
			if (username == null || username == "") {
				errMsg = "Username cannot be empty.";
				nextPage = "/LoginPage.jsp";
			} 
			
			else if (password == null || password == "") {
				errMsg = "Password cannot be empty.";
				nextPage = "/LoginPage.jsp";
			}
			
			else {
				User user = new User(username, password);
				session = request.getSession(true);
				session.setAttribute("user", user);
				System.out.println("User successfully logged in.");
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

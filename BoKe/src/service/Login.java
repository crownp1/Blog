package service;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Dao.IndexDao;
import Dao.UserDao;
import Entity.Article;
import Entity.User;
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public Login() {
        super();
       
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	   request.setCharacterEncoding("utf-8"); /*解决中文乱码问题*/
	   response.setContentType("text/html;charset=utf-8"); 
	   response.setCharacterEncoding("utf-8");
	   PrintWriter out = response.getWriter();
	   //更改编码方式
	 	  
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		UserDao userDao = new UserDao();
		User user = userDao.checkUser(username, password);
		if(user == null) {
			out.println("登录失败!请重新登录");
			response.setHeader("Refresh", "3;URL=login.jsp");
		}
		else {
			HttpSession session = request.getSession();
			session.setAttribute("user", user);
			request.getRequestDispatcher("Blog.jsp").forward(request, response);
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

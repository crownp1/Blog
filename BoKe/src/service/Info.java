package service;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Dao.UserDao;
import Entity.User;

@WebServlet("/Info")
public class Info extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
    public Info() {
        super();       
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out= response.getWriter();
		UserDao userdao = null;
		try {
			   userdao = new UserDao();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		User user=(User) request.getSession().getAttribute("user");
			
		String s = user.getPassword();
		String s0 = user.getUsername();
		String s1 = request.getParameter("pwd");
		String s2 = request.getParameter("password1");
		System.out.print(s);
		System.out.print(s0);
		if(s1.equals(s)){
			if(userdao.update(s2,s0)!=0) {			
				try {
					request.getRequestDispatcher("login.jsp").forward(request, response);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			else {
				request.getRequestDispatcher("SelfInfo.jsp").forward(request, response);
			}
		}else {
			out.println("原密码错误");
		}
		
	
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

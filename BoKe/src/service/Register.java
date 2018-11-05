package service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.UserDao;
import Entity.User;

@WebServlet("/Register")
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public Register() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		  request.setCharacterEncoding("utf-8"); /*解决中文乱码问题*/
		   response.setContentType("text/html;charset=utf-8"); 
		   response.setCharacterEncoding("utf-8");
		   PrintWriter out = response.getWriter();
		   //更改编码方式
		   String username = request.getParameter("username");
		   String Password = request.getParameter("Password");
		   String email = request.getParameter("email");
		   String phone = request.getParameter("phone");
		   String qq = request.getParameter("qq");
		   String info = request.getParameter("info");
		   
		   User user = new User(username,Password,email,phone,qq,info);
		   UserDao userDao = new UserDao();
		   User user1 = userDao.check(username);
		   
		   if(user1==null) {   
		   if(userDao.register(user)!=0) {
			   out.println("注册成功");
			   response.setHeader("Refresh", "3;URL=login.jsp");
		   }else {
			   out.println("失败");
			   response.setHeader("Refresh", "3;URL=sgin.jsp");
		   }
		   }else {
			   out.print("该用户已经注册");
			   request.setAttribute("user", user1);
		   }
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

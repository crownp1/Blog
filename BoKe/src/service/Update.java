package service;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Dao.ArticleDao;
@WebServlet("/Update")
public class Update extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public Update() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//设置请求和响应的编码统一为UTF-8
		   request.setCharacterEncoding("utf-8"); /*解决中文乱码问题*/
		   response.setContentType("text/html;charset=utf-8"); 
		   response.setCharacterEncoding("utf-8");
		   HttpSession session = request.getSession();
		   int id = (int) session.getAttribute("id");
		   System.out.println(id);
		   String title = request.getParameter("title");
		   String content =request.getParameter("container");
		   String datetime=new SimpleDateFormat("yyyy-MM-dd").format(Calendar.getInstance().getTime()); //获取系统时间 
		   ArticleDao articleDao = new ArticleDao();
		   int result = articleDao.updateById(id,title,content,datetime);
		   System.out.println("result"+result);
		   if(result == 0) {
			   response.getWriter().append("修改失败!");
		   }
		   request.getRequestDispatcher("Blog.jsp").forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

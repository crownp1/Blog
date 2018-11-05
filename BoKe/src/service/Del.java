package service;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.ArticleDao;

/**
 * 根据博客id进行删除
 */
@WebServlet("/Del")
public class Del extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public Del() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//设置请求和响应的编码统一为UTF-8
		   request.setCharacterEncoding("utf-8"); /*解决中文乱码问题*/
		   response.setContentType("text/html;charset=utf-8"); 
		   response.setCharacterEncoding("utf-8");
		   int id = Integer.parseInt(request.getParameter("id"));
		   ArticleDao articleDao = new ArticleDao();
		   int del = articleDao.deleteOne(id);
		   if(del==0) {
			   response.getWriter().append("删除失败");
		   }
		   request.getRequestDispatcher("Blog.jsp").forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

package service;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/*import org.apache.taglibs.standard.tag.common.fmt.ParseDateSupport;*/

import Dao.ArticleDao;
import Entity.Article;
import Entity.User;

@WebServlet("/Uediter")
public class Uediter extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public Uediter() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 //设置请求和响应的编码统一为UTF-8
	   request.setCharacterEncoding("utf-8"); /*解决中文乱码问题*/
	   response.setContentType("text/html;charset=utf-8"); 
	   response.setCharacterEncoding("utf-8");
        //拿到编辑器的内容
        String title = request.getParameter("title");
        String time = request.getParameter("time");
        //将字符串转换为时间类型
        String datetime=new SimpleDateFormat("yyyy-MM-dd").format(Calendar.getInstance().getTime()); //获取系统时间 
        System.out.println(datetime);
        int type = Integer.parseInt(request.getParameter("type"));
        String content = request.getParameter("container");
        User user = (User) request.getSession().getAttribute("user");
        Article article = new Article(title, content, datetime, user.getId(), type);
        ArticleDao articleDao = new ArticleDao();
        int result = articleDao.insertArticle(article);
        System.out.println("结果:"+result);
        
        //如果不为空
        if(result == 0){
            response.getWriter().append("发布失败!");
        }
        request.getRequestDispatcher("Blog.jsp").forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	

}

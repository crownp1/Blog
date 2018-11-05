package Dao;

import java.util.List;

import Entity.Article;

public class ArticleDao extends DBUtilsBaseDao{
	//添加一条博客信息
     public int insertArticle(Article article) {
    	 int result = 0;
    	 String sql = "insert into t_article(title,content,pub_date,user_id,articletype_id)  values(?,?,?,?,?)";
    	 Object[] params = new Object[]{article.getTitle(),article.getContent(),article.getPub_date(),
    			 article.getUser_id(),article.getArticletype_id()};
    	 result = update(sql,params);
    	 return result;
     }
     //根据博客id查询详细信息
     public Article queryById(int id) {
    	 Article article = null;
    	 String sql = "select b.id,user_id,username,title,content,pub_date,articletype_id "
    	 		+ " from t_user a LEFT join t_article b on a.id=b.user_id"
    	 		+ " where b.id = ?";
    	 List<Article> list = query(sql,Article.class,id);
    	 if(list!=null&&list.size()>0)
			{
    		 article=list.get(0);
			}
    	 return article;
     }
     
   //根据博客标题查询详细信息
     public Article queryByTil(String title) {
    	 Article article = null;
    	 String sql = "select * from t_article where title=?";
    	 List<Article> list = query(sql,Article.class,title);
    	 if(list!=null&&list.size()>0)
			{
    		 article=list.get(0);
			}
    	 return article;
     }
     
     public int updateById(int id, String title, String content, String datetime) {
 		int result = 0;
 		String sql = "update t_article set title = ?,content = ?,pub_date=? where id =?";
 		Object[] params = new Object[] {title,content,datetime,id};
 		result = update(sql,params);
 		return result;
 	}
     public static void main(String[] args) {
    	 ArticleDao articleDao = new ArticleDao();
    	 Article article = articleDao.queryById(1);
    	 System.out.println(article);
  
     }
     //删除一条博客信息
	public int deleteOne(int id) {
		String sql = "delete from t_article where id=?";
		int del = update(sql,id);
		return del;
	}
	
}

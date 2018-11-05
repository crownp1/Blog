package Dao;

import java.util.List;
import Entity.Article;
import Entity.ArticleType;

public class IndexDao extends DBUtilsBaseDao{

	//查询所有博客
	public List<Article> queryAll(String condition,String id){
		String sql  = null;
		List<Article> list = null;
		if(id==null) {
		if(condition!=null&&!"".equals(condition)) {//实现搜索框的功能
			sql="select b.id,user_id,username,title,content,pub_date,articletype_id "
					+ "from t_user a LEFT join t_article b on a.id=b.user_id"
					+ " LEFT JOIN t_articletype c on b.articletype_id = c.id "
					+ "where concat(username,title,content,type) like '%"+condition+"%'";
		}else {
		sql = "select b.id,user_id,username,title,content,pub_date,articletype_id "
				+ "from t_user a LEFT join t_article b on a.id=b.user_id "
				+ "LEFT JOIN t_articletype c on b.articletype_id = c.id";
		}
		list = query(sql,Article.class,null);
		}else {//根据id查询某一类型博客
			if(condition!=null&&!"".equals(condition)) {
				sql="select b.id,user_id,username,title,content,pub_date,articletype_id "
						+ "from t_user a LEFT join t_article b on a.id=b.user_id"
						+ " LEFT JOIN t_articletype c on b.articletype_id = c.id "
						+ "where concat(username,title,content,type) like '%"+condition+"%' and articletype_id = ?";
			}else {
			sql = "select b.id,user_id,username,title,content,pub_date,articletype_id "
					+ "from t_user a LEFT join t_article b on a.id=b.user_id "
					+ "LEFT JOIN t_articletype c on b.articletype_id = c.id where articletype_id = ?";
			}
			list = query(sql,Article.class,id);
		}
		return list;
	}
	//根据用户id查找博客
	public List<Article> queryById(String id){
		String sql = "select id,title,content,pub_date from t_article where user_id= ? order by pub_date";
		List<Article> list = query(sql,Article.class,id);
		return list;
	}
	//统计每一类型文章的数量
     public List<ArticleType> queryAll(){
    	 String sql="select c.id,count(type) as count,type from t_articletype c LEFT JOIN  t_article b   on b.articletype_id = c.id GROUP BY type";
    	List<ArticleType> list = query(sql,ArticleType.class,null);
    	return list;
    }
    //查询总量
  
/*	public static void main(String[] args) {
		IndexDao indexDao = new IndexDao();
		Object list = indexDao.getCount();
		
			System.out.println("ArticleType :"+list);

	}*/

}

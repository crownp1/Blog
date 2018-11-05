package Entity;

import java.io.Serializable;
import java.util.Date;

public class Article implements Serializable{
    private int id;//文章编号
    
    private String title;//文章标题
    
    private String content;//文章内容
    
    private String pub_date;//发布时间
    
    private int user_id;//发布人编号
    
    private String username;//发布人
    
    private int articletype_id;//类型编号
    

	public Article() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Article(String title, String content, String pub_date, int user_id, int articletype_id) {
		super();
		this.setTitle(title);
		this.setContent(content);
		this.setPub_date(pub_date);
		this.setUser_id(user_id);
		this.setArticletype_id(articletype_id);
	
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getPub_date() {
		return pub_date;
	}

	public void setPub_date(String pub_date) {
		this.pub_date = pub_date;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public int getArticletype_id() {
		return articletype_id;
	}

	public void setArticletype_id(int articletype_id) {
		this.articletype_id = articletype_id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	@Override
	public String toString() {
		return "Article [id=" + id + ", title=" + title + ", content=" + content + ", pub_date=" + pub_date
				+ ", user_id=" + user_id + ", username=" + username + ", articletype_id=" + articletype_id 
				 +  "]";
	}

	
    
	
    
}

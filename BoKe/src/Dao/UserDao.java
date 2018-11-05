package Dao;

import java.util.List;

import Entity.Article;
import Entity.User;

public class UserDao extends DBUtilsBaseDao {
	//验证登录
	public User checkUser(String username,String password) {
		User user = null;
		String sql = "select * from t_user where username=? and password = ?";
		Object[] param=new Object[]{username,password};
		List<User> list = query(sql,User.class,param);
		if(list!=null&&list.size()>0)
		{
			user=list.get(0);
		}
		return user;
	}
	//注册
	public int register(User user) {
		String sql = "insert into t_user(username,password,email,phone,qq,info) values(?,?,?,?,?,?) ";
		Object[] param = new Object[] {user.getUsername(),user.getPassword(),
				user.getEmail(),user.getPhone(),user.getQq(),user.getInfo()
		};
		return update(sql,param);
	}
	//验证是否已经注册过
		public User check(String username) {
			User user = null;
			String sql = "select * from t_user where username=?";
			List<User> list = query(sql,User.class,username);
			if(list!=null&&list.size()>0)
			{
				user=list.get(0);
			}
			return user;
		}
		public int update(String password,String username) {
			String sql="update t_user set password=? where username=?";
		    Object[] param = new Object[] {password,username};
			return update(sql,param);	
		}
/*	public static void main(String[] args) {
		UserDao userDao = new UserDao();
		String username = "张三";
		String password = "654322";
		int user = userDao.update(password, username);
		if (user == 0) {
			System.out.println("失败");
			
		}else {
			System.out.println("成功");
			System.out.println("userid:"+user);
		}	
	}*/
}

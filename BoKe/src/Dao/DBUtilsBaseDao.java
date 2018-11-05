package Dao;

/*import java.beans.PropertyVetoException;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Properties;
import com.mchange.v2.c3p0.ComboPooledDataSource;

public class Conn {
	private static String driver;
	private static String dburl;
	private static String user;
	private static String password;
	public static ComboPooledDataSource dataSource;
	private static final Conn factory = new Conn();

	private Connection conn = null;
		static {
			Properties prop = new Properties();
			try {
				InputStream inputStream = Conn.class.
				getClassLoader().getResourceAsStream("db.properties");
				prop.load(inputStream);
				driver = prop.getProperty("driver");
				dburl = prop.getProperty("dburl");
				user = prop.getProperty("user");
				password = prop.getProperty("password");
				dataSource = new ComboPooledDataSource();
				dataSource.setUser(user);
				dataSource.setPassword(password);
				dataSource.setJdbcUrl(dburl);
				dataSource.setDriverClass(driver);
				dataSource.setInitialPoolSize(10);
				dataSource.setMinPoolSize(5);
				dataSource.setMaxPoolSize(50);
				dataSource.setMaxStatements(100);
				dataSource.setMaxIdleTime(60);
			} catch (IOException e) {
				System.out.println("the file of datasouce configuration is not exist!");
				e.printStackTrace();
			} catch (PropertyVetoException e) {
				System.out.println("datasouce config error!");
				e.printStackTrace();
			}
			System.out.println("datasouce init finish........!");
		}

		private Conn() {
		}

		public static Conn getInstance() {
			return factory;
		}

		public static ComboPooledDataSource getDataSouce(){
			return dataSource;
		}
		public Connection getConnection() {
			if (null != dataSource) {
				try {
					conn = dataSource.getConnection();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			return conn;
		}
}*/


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.List;
 
import org.apache.commons.dbutils.DbUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
 
public class DBUtilsBaseDao {
	//得到数据库连接
	public  Connection getConn()
	{
		Connection conn=null;
		DbUtils.loadDriver("com.mysql.jdbc.Driver");
		try {
			conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/wl2016?useUnicode=true&characterEncoding=utf-8","root","123456");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return conn;
	}
	
	//增、删、改数据库的方法
	public int update(String sql,Object... param)
	{
		int result=0;
		Connection conn=getConn(); //得到连接
		QueryRunner runner=new QueryRunner();  //得到运行对象
		try {
			result=runner.update(conn, sql, param); //进行数据库操作
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally
		{
			DbUtils.closeQuietly(conn);  //关闭数据库连接
		}
		return result;
	}
	
	//数据库查询
	public List query(String sql,Class clazz,Object... param)
	{
		List list=null;
		Connection conn=getConn(); //得到连接
		QueryRunner runner=new QueryRunner();  //得到运行对象
		try {
			list=(List) runner.query(conn,sql,new BeanListHandler(clazz),param); //进行数据库操作
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally
		{
			DbUtils.closeQuietly(conn);  //关闭数据库连接
		}
		return list;
	}
 	  //批量操作数据库的方法
		public boolean bactchUpdate(String sql,Object[][] param)
		{
			int[] result=new int[param.length];
			int r=1;
			
			Connection conn=getConn(); //得到连接			
			QueryRunner runner=new QueryRunner();  //得到运行对象
			try {
				result=runner.batch(conn,sql,param);// 批量进行数据库操作
			} catch (SQLException e) {
				e.printStackTrace();
			}
			finally
			{
				DbUtils.closeQuietly(conn);  //关闭数据库连接
			}
			for(int i=0;i<result.length;i++)
			{
				r*=result[i];
			}
			return r>0?true:false;
		}
}
package util;

import java.io.IOException;
import java.io.InputStream;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;








/*
 * 数据库配置的工具类*/
public class DataBaseUtils {
	private static String username;
	private static String password;
	private static String dataBaseName;
	
	//自动配置数据库信息
	static {
		config("jdbc.properties");
	}
	/*配置数据库的基本信息*/
	public static void config(String path) {
		InputStream inputStream = DataBaseUtils.class.getClassLoader().getResourceAsStream(path);
		Properties p = new Properties();
		try {
			p.load(inputStream);
			username = p.getProperty("db.username");
			password = p.getProperty("db.password");
			dataBaseName = p.getProperty("db.dataBaseName");
		} catch ( IOException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	
	
	/*
	 * 获取数据库连接
	 * */
	public static Connection getConnection() {
		Connection connection = null;
		try {
			 Class.forName("com.mysql.jdbc.Driver");
			 connection  = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+dataBaseName+
					 "?useUnicode=true&characterEncoding=utf8&useSSL=false",username,password);
		} catch (ClassNotFoundException e) {
			// TODO: handle exception
			e.printStackTrace();
		}catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return connection;
	}
	
	/*
	 * 关闭资源
	 * */
	public static void closeConnection(Connection connection,PreparedStatement statement,ResultSet rs) {
		try {
			if (rs!=null) {
				rs.close();
			}
			if (statement!=null) {
				statement.close();
			}
			if (connection!=null) {
				connection.close();
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.fillInStackTrace();
		}
		
	}
	
	/*
	 * DML操作
	 * 数据的增删查改
	 * */
	public static void update(String sql,Object... objects) {
		Connection connection = getConnection();
		PreparedStatement statement=null;
		try {
			statement =(PreparedStatement) connection.prepareStatement(sql);
			for (int i = 0; i < objects.length; i++) {
				statement.setObject(i+1, objects[i]);
			}
			statement.executeUpdate();
		} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			closeConnection(connection, statement, null);
		}
	}
	
	/*
	 * 查询整张数据库表的内容
	 * @return list*/
	public static List<Map<String,Object>> queryForList(String sql,Object...objects){
		    List<Map<String,Object>> result = new ArrayList<Map<String,Object>>();
		    Connection connection = getConnection();
		    PreparedStatement statement = null;
		    ResultSet rs = null;
		    try {
		        statement = connection.prepareStatement(sql);
		        for (int i = 0; i < objects.length; i++) {
		            statement.setObject(i+1, objects[i]);
		        }
		        
		        rs = statement.executeQuery();
		        while(rs.next()){
		            ResultSetMetaData resultSetMetaData = rs.getMetaData();
		            int count = resultSetMetaData.getColumnCount(); //获取列数
		            Map<String,Object> map = new HashMap<String, Object>();
		            for (int i = 0; i < count; i++) {
		                map.put(resultSetMetaData.getColumnName(i+1), rs.getObject(resultSetMetaData.getColumnName(i+1)));
		            }
		            result.add(map);
		        };
		    } catch (SQLException e) {
		        e.printStackTrace();
		    }finally{
		        closeConnection(connection, statement, rs);
		    }
		    
		    return result;
	}
	
	/*
	 * 查询单条数据
	 * @return map*/
	public static Map<String, Object> queryForMap(String sql,Object...objects) throws SQLException{
		Map<String,Object> result = new HashMap<>();
		List<Map<String, Object>> list = queryForList(sql, objects);
		if (list.size()!=1) {
			return null;
		}
		result = list.get(0);
		return result;
	}
	
	/*
	 * 查询数据并返回一个javaBean
	 * @param sql
	 * @param clazz
	 * @param objects
	 * @return T
	 * @throws NoSuchFieldException
	 * @throws SecurityException*/
	@SuppressWarnings("unchecked")
	public static <T>T queryForBean(String sql,Class<?> clazz,Object...objects)  {
		T obj =null;
		Map<String,Object> map =null;
		Field field = null;
		try {
			obj = (T) clazz.newInstance();
			map = queryForMap(sql, objects);
		} catch (InstantiationException | IllegalAccessException e) {
			// TODO: handle exception
			e.printStackTrace();
		}catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		if (map == null) {
			return null;
		}
		
		for (String columnName : map.keySet()) {
			Method method = null;
			String propertyName  = StringUtils.columnToProperty(columnName);//属性名称
			try {
				field = clazz.getDeclaredField(propertyName);
				//System.out.println(propertyName);
				//System.out.println(field);
			} catch (NoSuchFieldException e) {
				// TODO: handle exception
				e.printStackTrace();
			}catch (SecurityException e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			//获取javabean 中的字段
			String fieldType = field.toString().split(" ")[1]; //获取该字段的类型
			Object value = map.get(columnName);
			if (value == null) {
				continue;
			}
			
			try {
				//获取值类型
				String valueType = value.getClass().getName();
				
				//查看类型是否匹配
				if (!fieldType.equalsIgnoreCase(valueType)) {
					//类型不匹配的进行强制类型转换
					if (fieldType.equalsIgnoreCase("java.lang.Integer")) {
						value = Integer.parseInt(String.valueOf(value));
					}else if (fieldType.equalsIgnoreCase("java.lang.String")) {
						value = String.valueOf(value);
					}else if (fieldType.equalsIgnoreCase("java.lang.Date")) {
						//转化成date类型
						valueType = "java.lang.Date";
						String dateStr = String.valueOf(value);
						Timestamp timestamp = Timestamp.valueOf(dateStr);
						Date date = new Date(timestamp.getTime());
						value =date;
					}
				}
				
				//获取set方法的名字
				String setMethodName = "set" 
						+ StringUtils.upperCaseFirstCharacter(propertyName);
				//获取set方法
				method  = clazz.getDeclaredMethod(setMethodName, Class.forName(fieldType));
				//执行set方法
				method.invoke(obj, value);
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}
		return obj;
	}
}

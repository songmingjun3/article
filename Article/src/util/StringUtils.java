package util;



public class StringUtils {
	public static boolean isEmpty(String str) {
		return str ==null || str.equals("") || str.matches("\\s*");
	}
	
	public static String defaultValue(String content,String defaultValue) {
		if (isEmpty(content)) {
			return defaultValue;
		}
		return content;
	}
	
	/*
	 * 将数据库字段改成驼峰方式
	 * */
	public static String columnToProperty(String column) {
		// TODO Auto-generated constructor stub
	
		if (isEmpty(column)) {
			return "";
		}
		Byte length = (byte) column.length();
		StringBuilder sb =new StringBuilder(length);
		//int i = 0;
		for (int j = 0; j <length; j++) {
			if (column.charAt(j) == '_') {
				while(column.charAt(j+1)=='_') {
					j+=1;
				}
				sb.append((""+column.charAt(++j)).toUpperCase());//循环到‘_’后首个字母变成大写
			}else {
				sb.append(column.charAt(j));
			}
		}
		return sb.toString();
	}
	
	/*
	 * 将一个字符串的首字母改成大写
	 * */
	public static String upperCaseFirstCharacter(String str) {
		StringBuilder sb =  new StringBuilder();
		char[] arr = str.toCharArray();
		for (int i = 0; i < arr.length; i++) {
			if (i==0) {
				sb.append((arr[i]+"").toUpperCase());//为什么要加""？
			}else {
				sb.append((arr[i]+""));
			}
		}
		return sb.toString();
	}
}

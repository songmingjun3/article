package util;

import java.lang.reflect.Field;
import annotation.Column;
import annotation.Table;

public class TableUtils {
	public static String getCreateTableSQL(Class<?> clazz) {
		StringBuilder sb = new StringBuilder();

		// 获得表名
		Table table = (Table) clazz.getAnnotation(Table.class);
		String tableName = table.tableName();
		sb.append("DROP TABLE IF EXISTS ").append(tableName).append(";\n");// 删除旧表的sql语句
		sb.append("create table "); // 创建表
		sb.append(tableName).append("(\n");

		Field[] fields = clazz.getDeclaredFields();
		String primaryKey = "";
		
		for (int i = 0; i < fields.length; i++) {
			Column column = (Column) fields[i].getAnnotations()[0];
			String field = column.field();
			String type = column.type();
			boolean defaultNull = column.defaultNull();
			sb.append("\t" + field).append(" ").append(type);

			if (defaultNull) {
				if (type.toUpperCase().equals("TIMESTAMP")) {
					sb.append(",\n");
				} else {
					sb.append(" DEFAULT NULL,\n");
				}
			} else {
				sb.append(" NOT NULL, \n");
			}
			if (column.primaryKey()) {
				primaryKey = "PRIMARY KEY (" + field + ")";
			}
		}
		if (!StringUtils.isEmpty(primaryKey)) {
			sb.append("\t").append(primaryKey);
		}
		sb.append("\n) DEFAULT CHARSET=utf8");
		return sb.toString();
	}
}

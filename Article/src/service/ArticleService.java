package service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import bean.Article;
import util.DataBaseUtils;

public class ArticleService {
	/*
	 * 通过类别获取文章列表
	 * */
	public  List<Map<String, Object>> getArticlesByCategoryId(Integer categoryId,Integer start,Integer end) {
		String sql ="select id,header,name,author,"
		        + "description from t_article where 1 = 1 "
		        + " and is_delete = 0"
		        + " and is_published = 1"
		        + " and category_id = ?"
		        + "  order by update_time desc limit ?,?";
		return DataBaseUtils.queryForList(sql, categoryId,start,end);
	}
	/**
	 * 通过文章id获取文章内容
	 * **/
	public  Map<String, Object> getContentByArticleId(String id) {
		String sql = "select * from t_article a inner join t_category b on a.category_id=b.category_id where a.id=?";
		return DataBaseUtils.queryForList(sql, id).get(0);
	}
	/*
	 * 写入文章到文章列表*/
	public void addArticle(Article article) {
		String sql = "insert into t_article(id,header,name,author,description,content,is_published,"
				+ "is_delete,create_time,update_time,user_id,category_id)" + 
				"value(?,?,?,?,?,?,?,?,?,?,?,?)";
		//暂时默认更新时间=创建时间
		DataBaseUtils.update(sql,article.getId(),article.getHeader(),
				article.getName(),article.getAuthor(),article.getDescription(),article.getContent(),
				article.getIsPublished(),article.getIsDelete(),article.getCreateTime(),
				article.getCreateTime(),article.getUserId(),article.getCategoryId());
	}
}

package test;

import java.sql.Connection;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import bean.Article;
import bean.Comment;
import bean.User;
import service.ArticleService;
import service.CommentService;
import util.DataBaseUtils;

public class TestDataBaseUtils {
	public static void main(String[] args) throws SQLException {

		//Connection connection = DataBaseUtils.getConnection();
		//System.out.println(connection);
		/*String id = UUID.randomUUID() + "";
		String createTime = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
		String state= "INSERT INTO t_user(id,username,password,sex,create_time,is_delete,address,telephone)"
				+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
		DataBaseUtils.update(state, id,"赵六",4913164,0,createTime,0,"保密","保密");
		*/
		//List<Map<String, Object>> list = DataBaseUtils.queryForList("select * from t_user");
		/*Map<String, Object> map = DataBaseUtils.queryForMap("select * from t_user where username = ?","李四");
 		System.out.println(map);*/
		/*Article  article= DataBaseUtils.queryForBean("select * from t_article where id=?",Article.class,"e3339ba3-5f49-4e09-8baa-640d8d17acce");
		System.out.println(article);
		*/
		/*ArticleService articleService = new ArticleService();
		List<Map<String, Object>> list = articleService.getArticlesByCategoryId(2,0,10);
		System.out.println(list);
		Map<String, Object> map =list.get(0);
		*/
		//List contentList = articleService.getContentByArticleId(map.get("id").toString());
		//System.out.println(contentList);
		/*CommentService cs = new CommentService();
		Comment comment = new Comment();
		comment.setId(UUID.randomUUID().toString());
		comment.setContent("很不错的文章，赞一个！");
		comment.setArticleId("fb6b70ea-4023-45a3-9106-561649803805");
		comment.setUserId("0d50f9c3-1822-416e-8139-b9cb26f74850");
		cs.saveComment(comment);
		System.out.println("保存成功!");
		System.out.println(DataBaseUtils.queryForList("select a.content from t_comment a left JOIN t_user b "
		        + "on a.user_id = b.id where a.article_id = 'fb6b70ea-4023-45a3-9106-561649803805'"));   
		*/
		CommentService cs = new CommentService();
		System.out.println(cs.getCommentsByArticleId("fb6b70ea-4023-45a3-9106-561649803805"));
	}
}

package test;

import java.util.List;
import java.util.UUID;

import org.junit.Test;

import com.sun.org.glassfish.gmbal.Description;

import util.DataBaseUtils;

public class TeatInsertOperation {
	/*
	 * 测试，给文章插入数据
	 * */
	@Test
	public void insertArticle() {
		String sql ="INSERT INTO t_article(id,header,name,content,author,"
				+ "description,is_published,is_delete,create_time,update_time"
				+ ",user_id,category_id) VALUES(?,?,?,?,?,?,?,?,?,?,?,?)";
		String id =UUID.randomUUID().toString();
		String header = "Java Web实用技术";
		String name ="如何将eclipse项目导入eclipse";
		String content ="我们经常在网上下载一些开源的项目，或者从别的地方迁移一些项目进来，但是经常"
				+ "会发现导入之后各种报错。这是初学java肯定会遇到的问题，本文对一些常见的处理方法做了总结。";
		String author ="godan";
		String description = "解决项目导入的冲突问题...";
		int isPublished =1 ;
		int isDelete =0;
		String createTime = "2018-3-8 21:45:00";
		String updateTime =	"2018-3-8 21:45:00";
		String userId = "319600c3-550a-4f9f-80cf-deebe2376528";
		int categoryId= 2;
		DataBaseUtils.update(sql, id,header,name,content,author,description,isPublished
				,isDelete,createTime,updateTime,userId,categoryId);
		System.out.println("新增成功");
	}
	@Test
	public void getCategoryList() {
		String sql ="select *from t_category where  1 = 1";
		List list = util.DataBaseUtils.queryForList(sql);
		System.out.println(list);
	}
}

package bean;

import annotation.Column;
import annotation.Table;

@Table(tableName = "t_comment")
public class Comment {
	@Column(type="varchar(100)",field="id",primaryKey=true,defaultNull=false)
	private String id;
	@Column(type="varchar(100)",field="user_id")
	private String userId;
	@Column(type="varchar(600)",field="content")
	private String content;
	@Column(type="varchar(100)",field="article_id")
	private String articleId;
	@Column(type="datetime",field="create_time")
	private String createTime;
	@Column(type="timestamp",field="update_time")
	private String updateTime;
	@Column(type ="int(1)",field="is_delete")
	private Integer isDelete;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userid) {
		this.userId = userid;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getArticleId() {
		return articleId;
	}
	public void setArticleId(String articleId) {
		this.articleId = articleId;
	}
	public String getCreateTime() {
		return createTime;
	}
	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}
	public String getUpdateTime() {
		return updateTime;
	}
	public void setUpdateTime(String updateTime) {
		this.updateTime = updateTime;
	}
	public Integer getIsDelete() {
		return isDelete;
	}
	public void setIsDelete(Integer isDelete) {
		this.isDelete = isDelete;
	}
	
	
}

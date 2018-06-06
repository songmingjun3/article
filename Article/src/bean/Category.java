package bean;
import annotation.Column;
import annotation.Table;

@Table(tableName = "t_category")
public class Category {
	@Column(field ="category_id",type ="int(2)",defaultNull=false,primaryKey=true)
	private Integer categoryId;
	@Column(field="category_name",type = "varchar(20)")
	private String categoryName;
}

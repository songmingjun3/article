package test;

import bean.Category;
import bean.Comment;
import util.TableUtils;

public class TestMain {
    public static void main(String[] args) {
        String sql = TableUtils.getCreateTableSQL(Comment.class);
        System.out.println(sql);
    }
}

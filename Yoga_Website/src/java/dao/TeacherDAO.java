package dao;

import model.Teacher;
import util.DatabaseConnection;
import java.sql.*;
import java.util.*;

public class TeacherDAO {
    public List<Teacher> getAllTeachers() throws Exception {
        List<Teacher> list = new ArrayList<>();
        String sql = "SELECT * FROM Teachers";
        try (Connection conn = DatabaseConnection.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()) {
                Teacher t = new Teacher();
                t.setId(rs.getInt("id"));
                t.setName(rs.getString("name"));
                t.setBio(rs.getString("bio"));
                list.add(t);
            }
        }
        return list;
    }
    // Thêm các hàm thêm, sửa, xóa nếu cần
}

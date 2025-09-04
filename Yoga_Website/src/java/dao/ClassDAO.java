package dao;

import model.Class;
import util.DatabaseConnection;
import java.sql.*;
import java.util.*;

public class ClassDAO {
    public List<Class> getAllClasses() throws Exception {
        List<Class> list = new ArrayList<>();
        String sql = "SELECT * FROM Classes";
        try (Connection conn = DatabaseConnection.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()) {
                Class c = new Class();
                c.setId(rs.getInt("id"));
                c.setName(rs.getString("name"));
                c.setDescription(rs.getString("description"));
                c.setSchedule(rs.getString("schedule"));
                c.setPrice(rs.getDouble("price"));
                c.setCapacity(rs.getInt("capacity"));
                list.add(c);
            }
        }
        return list;
    }
    // Thêm các hàm thêm, sửa, xóa nếu cần
}

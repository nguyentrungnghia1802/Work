package dao;

import model.User;
import util.DatabaseConnection;
import java.sql.*;

public class UserDAO {
    public User getUserByUsername(String username) throws Exception {
        String sql = "SELECT * FROM Users WHERE username = ?";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, username);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    User user = new User();
                    user.setId(rs.getInt("id"));
                    user.setUsername(rs.getString("username"));
                    user.setPassword(rs.getString("password"));
                    user.setRole(rs.getString("role"));
                    return user;
                }
            }
        }
        return null;
    }
    // Thêm các hàm đăng ký, cập nhật, xóa nếu cần
}

package dao;

import model.Registration;
import util.DatabaseConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class RegistrationDAO {
    
    public boolean addRegistration(Registration registration) {
        String sql = "INSERT INTO registrations (full_name, email, phone, class_name, package_type, note, registration_date, status) VALUES (?, ?, ?, ?, ?, ?, GETDATE(), ?)";
        
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setString(1, registration.getFullName());
            pstmt.setString(2, registration.getEmail());
            pstmt.setString(3, registration.getPhone());
            pstmt.setString(4, registration.getClassName());
            pstmt.setString(5, registration.getPackageType());
            pstmt.setString(6, registration.getNote());
            pstmt.setString(7, "ACTIVE");
            
            return pstmt.executeUpdate() > 0;
            
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    
    public List<Registration> getAllRegistrations() {
        List<Registration> registrations = new ArrayList<>();
        String sql = "SELECT * FROM registrations ORDER BY registration_date DESC";
        
        try (Connection conn = DatabaseConnection.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            
            while (rs.next()) {
                Registration reg = new Registration();
                reg.setId(rs.getInt("id"));
                reg.setFullName(rs.getString("full_name"));
                reg.setEmail(rs.getString("email"));
                reg.setPhone(rs.getString("phone"));
                reg.setClassName(rs.getString("class_name"));
                reg.setPackageType(rs.getString("package_type"));
                reg.setNote(rs.getString("note"));
                reg.setRegistrationDate(rs.getTimestamp("registration_date"));
                reg.setStatus(rs.getString("status"));
                
                registrations.add(reg);
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return registrations;
    }
    
    public boolean deleteRegistration(int id) {
        String sql = "DELETE FROM registrations WHERE id = ?";
        
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setInt(1, id);
            return pstmt.executeUpdate() > 0;
            
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    
    public Registration getRegistrationById(int id) {
        String sql = "SELECT * FROM registrations WHERE id = ?";
        
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setInt(1, id);
            ResultSet rs = pstmt.executeQuery();
            
            if (rs.next()) {
                Registration reg = new Registration();
                reg.setId(rs.getInt("id"));
                reg.setFullName(rs.getString("full_name"));
                reg.setEmail(rs.getString("email"));
                reg.setPhone(rs.getString("phone"));
                reg.setClassName(rs.getString("class_name"));
                reg.setPackageType(rs.getString("package_type"));
                reg.setNote(rs.getString("note"));
                reg.setRegistrationDate(rs.getTimestamp("registration_date"));
                reg.setStatus(rs.getString("status"));
                
                return reg;
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return null;
    }
    
    public List<Registration> searchRegistrations(String keyword) {
        List<Registration> registrations = new ArrayList<>();
        String sql = "SELECT * FROM registrations WHERE full_name LIKE ? OR email LIKE ? OR phone LIKE ? OR class_name LIKE ? ORDER BY registration_date DESC";
        
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            String searchPattern = "%" + keyword + "%";
            pstmt.setString(1, searchPattern);
            pstmt.setString(2, searchPattern);
            pstmt.setString(3, searchPattern);
            pstmt.setString(4, searchPattern);
            
            ResultSet rs = pstmt.executeQuery();
            
            while (rs.next()) {
                Registration reg = new Registration();
                reg.setId(rs.getInt("id"));
                reg.setFullName(rs.getString("full_name"));
                reg.setEmail(rs.getString("email"));
                reg.setPhone(rs.getString("phone"));
                reg.setClassName(rs.getString("class_name"));
                reg.setPackageType(rs.getString("package_type"));
                reg.setNote(rs.getString("note"));
                reg.setRegistrationDate(rs.getTimestamp("registration_date"));
                reg.setStatus(rs.getString("status"));
                
                registrations.add(reg);
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return registrations;
    }
}

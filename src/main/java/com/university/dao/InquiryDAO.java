package com.university.dao;

import com.university.database.DatabaseConfig;
import com.university.model.Inquiry;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class InquiryDAO {

    public void save(Inquiry inquiry) throws Exception {
        String sql = "INSERT INTO inquiries (name, email, phone, program, message) VALUES (?, ?, ?, ?, ?)";
        try (Connection conn = DatabaseConfig.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            pstmt.setString(1, inquiry.getName());
            pstmt.setString(2, inquiry.getEmail());
            pstmt.setString(3, inquiry.getPhone());
            pstmt.setString(4, inquiry.getProgram());
            pstmt.setString(5, inquiry.getMessage());
            
            pstmt.executeUpdate();
            
            try (ResultSet generatedKeys = pstmt.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    inquiry.setId(generatedKeys.getInt(1));
                }
            }
        }
    }

    public List<Inquiry> getAll() throws Exception {
        List<Inquiry> list = new ArrayList<>();
        String sql = "SELECT id, name, email, phone, program, message, created_at FROM inquiries ORDER BY created_at DESC";
        try (Connection conn = DatabaseConfig.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {
            while (rs.next()) {
                Inquiry inquiry = new Inquiry();
                inquiry.setId(rs.getInt("id"));
                inquiry.setName(rs.getString("name"));
                inquiry.setEmail(rs.getString("email"));
                inquiry.setPhone(rs.getString("phone"));
                inquiry.setProgram(rs.getString("program"));
                inquiry.setMessage(rs.getString("message"));
                inquiry.setCreatedAt(rs.getTimestamp("created_at"));
                list.add(inquiry);
            }
        }
        return list;
    }

    public void delete(int id) throws Exception {
        String sql = "DELETE FROM inquiries WHERE id = ?";
        try (Connection conn = DatabaseConfig.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, id);
            pstmt.executeUpdate();
        }
    }

    public Map<String, Integer> getProgramCounts() throws Exception {
        Map<String, Integer> counts = new HashMap<>();
        String sql = "SELECT program, COUNT(*) as count FROM inquiries WHERE program IS NOT NULL AND program <> '' GROUP BY program";
        try (Connection conn = DatabaseConfig.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {
            while (rs.next()) {
                counts.put(rs.getString("program"), rs.getInt("count"));
            }
        }
        return counts;
    }
}

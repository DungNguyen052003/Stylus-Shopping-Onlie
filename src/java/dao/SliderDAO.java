/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DBContext;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Category;
import model.Slider;

/**
 *
 * @author TienP
 */
public class SliderDAO extends DBContext {

    public List<Slider> listSlider() {
        List<Slider> listFound = new ArrayList<>();
        String sql = """
                     select * from slider sl join Category ct 
                     on sl.CategoryID = ct.CateID
                     where sl.status = 1""";

        try {
            statement = connection.prepareStatement(sql);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                Slider slider = new Slider();
                slider.setId(resultSet.getInt("SliderID"));
                slider.setImage(resultSet.getString("Image"));
                slider.setTitle(resultSet.getString("Title"));
                slider.setStatus(resultSet.getInt("Status"));
                slider.setNote(resultSet.getString("Note"));
                Category ct = new Category();
                ct.setCateID(resultSet.getInt("CateID"));
                ct.setName(resultSet.getString("Name"));
                slider.setCategoryId(ct);
                slider.setBacklink(resultSet.getString("Backlink"));
                listFound.add(slider);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return listFound;
    }

    public List<Slider> listAllSlider(int page, int pageSize) {
        List<Slider> listSlider = new ArrayList<>();
        String sql = """
                     SELECT *
                     FROM [Slider] sl join Category ct
                     on sl.SliderID = ct.CateID
                     ORDER BY SliderID 
                     OFFSET ? ROWS
                     FETCH NEXT ? ROWS ONLY""";
        try {
            statement = connection.prepareStatement(sql);
            int offset = (page - 1) * pageSize;
            statement.setInt(1, offset);
            statement.setInt(2, pageSize);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                Slider slider = new Slider();
                slider.setId(resultSet.getInt("SliderID"));
                slider.setImage(resultSet.getString("Image"));
                slider.setTitle(resultSet.getString("Title"));
                slider.setStatus(resultSet.getInt("Status"));
                slider.setNote(resultSet.getString("Note"));
                Category ct = new Category();
                ct.setCateID(resultSet.getInt("CateID"));
                ct.setName(resultSet.getString("Name"));
                slider.setCategoryId(ct);
                slider.setBacklink(resultSet.getString("Backlink"));
                listSlider.add(slider);
            }

        } catch (SQLException e) {
            System.out.println(e);
        }
        return listSlider;
    }

    public int getTotalRecord() {
        String sql = "SELECT COUNT(*) AS total FROM Slider";
        int totalRecords = 0;
        try {
            statement = connection.prepareStatement(sql);
            resultSet = statement.executeQuery();
            if (resultSet.next()) {
                totalRecords = resultSet.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return totalRecords;
    }

    public boolean updateSliderStatus(int sliderID, int status) {
        String sql = """
                     UPDATE [dbo].[Slider]
                        SET [Status] = ?
                        WHERE SliderID =?""";
        try {
            statement = connection.prepareStatement(sql);
            statement.setInt(1, status);
            statement.setInt(2, sliderID);
            int updateStatus = statement.executeUpdate();
            return updateStatus > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public void updateSlider(Slider slider) {
        String sql = """
                     UPDATE [dbo].[Slider]
                        SET [Title] = ?
                           ,[Image] = ?
                           ,[Status] =?
                           ,[Backlink] = ?
                      WHERE SliderID = ?""";
        try {
            statement = connection.prepareStatement(sql);
            statement.setString(1, slider.getTitle());
            statement.setString(2, slider.getImage());
            statement.setInt(3, slider.getStatus());
            statement.setString(4, slider.getBacklink());
            statement.setInt(5, slider.getId());
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Slider> filterSliders(String search, int status, int page, int pageSize) {
        List<Slider> listSlider = new ArrayList<>();
        String sql1 = """
                      SELECT * 
                        FROM Slider
                        WHERE 1 = 1""";

        if (search != null && !search.isEmpty()) {
            sql1 += " AND Title LIKE ?";
        }
        if (status == 0 || status == 1) {
            sql1 += " AND Status = ?";
        }
        String sql2 = " ORDER BY SliderID\n"
                + "  OFFSET ? ROWS\n"
                + "  FETCH NEXT ? ROWS ONLY";
        String sql = sql1 + sql2;
        try {
            statement = connection.prepareStatement(sql);
            int parameterIndex = 1;

            if (search != null && !search.isEmpty()) {
                statement.setString(parameterIndex++, "%" + search + "%");
            }
            if (status == 0 || status == 1) {
                statement.setInt(parameterIndex++, status);
            }
            int offset = (page - 1) * pageSize;
            statement.setInt(parameterIndex++, offset);
            statement.setInt(parameterIndex++, pageSize);

            resultSet = statement.executeQuery();

            while (resultSet.next()) {
                Slider slider = new Slider();
                slider.setId(resultSet.getInt("SliderID"));
                slider.setImage(resultSet.getString("Image"));
                slider.setTitle(resultSet.getString("Title"));
                slider.setStatus(resultSet.getInt("Status"));
                slider.setNote(resultSet.getString("Note"));

                listSlider.add(slider);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return listSlider;
    }

    public int getTotalFilteredRecord(String search, int status) {
        String sql = "SELECT COUNT(*) FROM Slider WHERE 1=1";
        List<Object> params = new ArrayList<>();
        if (search != null && !search.isEmpty()) {
            sql += " AND Title LIKE ?";
            params.add("%" + search + "%");
        }
        if (status != -1) {
            sql += " AND Status = ?";
            params.add(status);
        }
        int totalRecords = 0;
        try {
            statement = connection.prepareStatement(sql);
            for (int i = 0; i < params.size(); i++) {
                statement.setObject(i + 1, params.get(i));
            }
            try (ResultSet rs = statement.executeQuery()) {
                if (rs.next()) {
                    totalRecords = rs.getInt(1);
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return totalRecords;
    }

    public Slider getSliderById(String id) {
        Slider slider = new Slider();
        String sql = """
                     select * from slider sl join Category ct 
                     on sl.CategoryID = ct.CateID
                     where SliderID = ?
                    """;
        try {
            statement = connection.prepareStatement(sql);
            statement.setString(1, id);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                slider.setId(resultSet.getInt("SliderID"));
                slider.setImage(resultSet.getString("Image"));
                slider.setTitle(resultSet.getString("Title"));
                slider.setStatus(resultSet.getInt("Status"));
                slider.setNote(resultSet.getString("Note"));
                Category ct = new Category();
                ct.setCateID(resultSet.getInt("CateID"));
                ct.setName(resultSet.getString("Name"));
                slider.setCategoryId(ct);
                slider.setBacklink(resultSet.getString("Backlink"));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return slider;
    }
}

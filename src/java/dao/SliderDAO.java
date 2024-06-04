/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DBContext;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Product;
import model.Slider;

/**
 *
 * @author TienP
 */
public class SliderDAO extends DBContext {

    public List<Slider> listSlider() {
        List<Slider> listFound = new ArrayList<>();

        String sql = "select * from Slider sl\n"
                + "join Campain c on c.CampainID = sl.SliderCampainID\n"
                + "where c.Status = 1 ";

        try {
            statement = connection.prepareStatement(sql);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                Slider slider = new Slider();
                slider.setId(resultSet.getInt("SliderID"));
                slider.setImage(resultSet.getString("Image"));
                slider.setTitle(resultSet.getString("title"));
                slider.setStatus(resultSet.getInt("Status"));
                slider.setCampainID(resultSet.getInt("SliderCampainID"));
                slider.setNote(resultSet.getString("Note"));
                listFound.add(slider);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return listFound;
    }
}

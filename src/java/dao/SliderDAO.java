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

        String sql = "select top 3 * from Slider ";

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
                listFound.add(slider);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return listFound;
    }
}

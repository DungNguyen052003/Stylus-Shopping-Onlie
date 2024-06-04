/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package validation;

/**
 *
 * @author TienP
 */
public class Validate {
    public static boolean isValidPassword(String password) {
        // Kiểm tra độ dài
        if (password.length() < 8 || password.length() > 16) {
            return false;
        }

        // Kiểm tra chứa ít nhất một chữ cái thường, một chữ cái viết hoa, một chữ số và một ký tự đặc biệt
        if (!password.matches(".*[a-z].*") && !password.matches(".*[A-Z].*")
                && !password.matches(".*\\d.*") && !password.matches(".*[!@#$%^&*()-+=`~\\[\\]{}|;:'\",.<>?/\\\\].*")) {
            return false;
        }

        return true;
    }
}

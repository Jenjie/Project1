package util;

import model.Parameter.Personal;

import java.sql.*;

public class LoginDatabase {
    public static void CheckLogin(Personal personal) {
        Connection connect = null;
        Statement s = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connect = DriverManager.getConnection(Const.urlConnect);
            s = connect.createStatement();
            String username = personal.getUsername();
            String email = personal.getEmail();
            try {
                String sql = " SELECT email " +
                        "FROM  person " +
                        "WHERE email = '" + email + "' " ;
                ResultSet rec = s.executeQuery(sql);
                if(!rec.next()){
                    String login = "INSERT INTO person (email, name)  " +
                            "VALUE ('"+email+"','"+username+"')";
                    s.execute(login);
                }
                else {
                    System.out.print(username+","+email);
                }
            }catch (SQLException e){
                e.printStackTrace();
            }
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }
}

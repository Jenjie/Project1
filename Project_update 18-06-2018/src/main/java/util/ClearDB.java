package util;

import model.Parameter.Personal;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class ClearDB {
    public void clearDB(Personal personal) {
        String email = personal.getEmail();
        Connection connect = null;
        Statement s = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connect = DriverManager.getConnection(Const.urlConnect);
            s = connect.createStatement();
            try {
                String sql = "DELETE " +
                        "FROM  travel1 " +
                        "WHERE person_email = '" + email + "' ";
                s.execute(sql);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

    }
}

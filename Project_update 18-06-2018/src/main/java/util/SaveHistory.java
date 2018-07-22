package util;

import model.Parameter.PlaceID;
import java.sql.*;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

public class SaveHistory {
    public void Savehistory(PlaceID id){
        for(int i=0 ;i<id.getIdplace().size(); i++) {
            if(i==0){
                Inserthistory(id.getIdplace().get(i) , id.p_id ,"0");
            }
            else {
                Inserthistory(id.getIdplace().get(i) , id.p_id ,id.time.get(i));
            }
        }
    }

    public void Inserthistory(String placeid, String p_id ,String time){
        Connection connect = null;
        Statement s = null;
        String id = null ;
        String email = null ;
        String idplace = null ;
        String duration = null;
        String nameplace = null ;
        Date date = new Date();
        DateFormat dateFormat = new SimpleDateFormat("yyyy-mm-dd hh:mm");
        String strDate = dateFormat.format(date);
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connect = DriverManager.getConnection(Const.urlConnect);
            s = connect.createStatement();
            String sql = "SELECT travel.id, travel.person_email, travel.id_place,travel.duration, travel.nameplace " +
                    "FROM travel " +
                    "WHERE travel.id = '"+p_id+"' AND travel.id_place = '"+placeid+"' ";
            ResultSet rec = s.executeQuery(sql);
            while ((rec != null) && (rec.next())){
                 id = rec.getString(1);
                 email = rec.getString(2);
                 idplace = rec.getString(3);
                 duration = rec.getString(4);
                 nameplace = rec.getString(5);
            }
            try {
                String addsql = "INSERT INTO historytravel (id, email, placeid, duration, nameplace, stayplace,user_date) " +
                        "VALUE('"+id+"','"+email+"','"+idplace+"','"+duration+"','"+nameplace+"" + " ','"+time+"','"+strDate+"') ";
                s.execute(addsql);
            }catch (SQLException e){
                e.printStackTrace();
            }
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }
}

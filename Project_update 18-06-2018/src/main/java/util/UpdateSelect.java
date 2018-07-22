package util;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationFeature;
import model.Distance.Direction;
import model.Parameter.ReqParam;
import model.Parameter.parameter;

import java.io.StringWriter;
import java.net.URL;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class UpdateSelect {
    public void UpdateSelect(parameter param){
        List<String> setid = new ArrayList<String>();
        List<String> location = new ArrayList<String>();

        for (String pid : param.getIdplace()) {
            System.out.println(pid);
            DatabaseSelect(pid, location, setid ,param);
            setduration(param);
        }
        ObjectMapper objectMapper = new ObjectMapper();
        List<String> idplace = new ArrayList<String>();
        String distance;
        String mode = param.getMode() ;
        final String units = "metric";
        final String dis_KEY = "AIzaSyDHhsw_-_bGWp7LNTpAwl1EIA83smzGwnc";

        try {
            for(int i=0,j=i+1 ;j<location.size() ;i++,j++){
                Direction dt = objectMapper.readValue(new URL("https://maps.googleapis.com/maps/api/distancematrix/json?" +
                        "origins=" +location.get(i)+
                        "&destinations=" + location.get(j) +
                        "&units=" + units +
                        "&mode="+mode+
                        "&key=" + dis_KEY), Direction.class);
                distance = dt.getRows().get(0).getElements().get(0).getDuration().getText();
                System.out.println(distance+" "+location.get(i)+" "+location.get(j));
                Update(distance,setid.get(i),param);
            }
        }catch (Exception e){
            e.printStackTrace();
        }

        objectMapper.configure(SerializationFeature.INDENT_OUTPUT, true);
        StringWriter stringEmp = new StringWriter();

    }
    public static void Update(String minute,String idplace1, parameter param){
        Connection connect = null;
        Statement s = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connect = DriverManager.getConnection(Const.urlConnect);
            s = connect.createStatement();
            String f_id = param.getF_id();

            String sql = "UPDATE travel " +
                    "SET duration = '"+minute+"' " +
                    "WHERE id='"+f_id+"' AND id_place ='"+idplace1+"' " ;
            s.execute(sql);

        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

    public static void DatabaseSelect(String pid, List<String> location, List<String> setid ,parameter param) {
        Connection connect = null;
        Statement s = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connect = DriverManager.getConnection(Const.urlConnect);
            s = connect.createStatement();

            String f_id = param.getF_id();
            String sql = "SELECT lat,lng " +
                    "FROM travel " +
                    "WHERE id_place = '" + pid + "' AND id = '"+f_id+"' ";
            ResultSet rec = s.executeQuery(sql);

            while ((rec != null) && (rec.next())) {
                String lat = rec.getString("lat");
                String lng = rec.getString("lng");
                String loc = lat.concat(",").concat(lng);
                location.add(loc.trim());
                setid.add(pid);
            }
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }
    public void setduration(parameter param){
        Connection connect = null;
        Statement s = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connect = DriverManager.getConnection(Const.urlConnect);
            s = connect.createStatement();
            String f_id = param.getF_id();

            String sql = "UPDATE travel " +
                    "SET duration = null " +
                    "WHERE id='"+f_id+"' " ;
            s.execute(sql);

        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }
}

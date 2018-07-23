package util;

import model.Parameter.Personal;
import model.Place.Results;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;



public class BacktrackingAlgo {

    public void FunctionBacktracking(int limit, int [] visit, int now, int order, ArrayList<Integer> output,
                                     Integer [][] time, List<Results> place, int counttime, int stay, Personal personal)
    {
        List<Results> emptylisy = new ArrayList<Results>();
        double sumrate = 0.00;
        visit[now] = order;
        output.add(now);
        System.out.println("size :" +place.size()+", time"+counttime);
        int range = 999990 - 111110 + 1;
        int idnumber = (int) (Math.random()* range) + 111111;
        for(int j = 0 ;j < output.size();j++) {
            sumrate = sumrate + place.get(output.get(j)).getRating();
            emptylisy.add(place.get(output.get(j)));
            System.out.print(output.get(j)+" ");
        }
        if(emptylisy.size()>1 && counttime>0){
            DBbacktracking(emptylisy,counttime,sumrate,output.size(),personal,idnumber);
        }
        System.out.println("");
        for(int i = 0 ;i < place.size();i++) {
            if(visit[i] == 0 && time[now][i] != null ) {
                if(counttime + time[now][i] + stay <= limit) {
                    counttime = counttime + time[now][i] + stay;
                    FunctionBacktracking(limit,visit,i,order+1,output,time,place,counttime,stay,personal);
                    counttime = counttime - time[now][i] - stay;
                }
            }
        }
        visit[now] = 0;
        output.remove(output.size()-1);
    }
    public void DBbacktracking(List<Results> emptylist,int time ,double rating,int size,Personal personal,int id) {
        int i =1 ;
        String email = personal.getEmail();
        DecimalFormat df = new DecimalFormat("#0.00");
        double sumrate = Double.valueOf(df.format(rating/size)) ;
        Date date = new Date();
        DateFormat dateFormat = new SimpleDateFormat("yyyy-mm-dd hh:mm");
        String strDate = dateFormat.format(date);

        Connection connect = null;
        Statement s = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connect = DriverManager.getConnection(Const.urlConnect);
            s = connect.createStatement();
            try {
                if(emptylist!=null){
                    for(Results str : emptylist){
                        String addsql = "INSERT INTO travel(id, sumRating, nameplace, lat, lng, address, type, id_place, reffer_photo, user_date, orderplace, person_email,duration)  " +
                                "VALUE('"+id+"','"+sumrate+"','"+str.getName()+"','"+str.getGeometry().getLocation().getLat()+"','"+str.getGeometry().getLocation().getLng()+"" +
                                " ','"+str.getVicinity()+"','"+str.getType()+"','"+str.getPlace_id()+"','"+str.getPhotos().get(0).getPhoto_reference()+"'," +
                                " '"+strDate+"','"+i+"','"+email+"')";
                        s.execute(addsql);
                        i++;
                    }
                }
            }catch (SQLException e){
                e.printStackTrace();
            }
            System.out.println("SUCCESS");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public void print(List<Results> emptylist,int time ,double rating,int size,Personal personal,int id){
        String user = personal.getEmail();
        int i =1;
        DecimalFormat df = new DecimalFormat("#0.00");
        double sumrate = Double.valueOf(df.format(rating/size)) ;
        System.out.println(id+" , "+time+" , "+sumrate+" , "+user);
        for (Results results : emptylist){
            System.out.println(i+" "+results.getName());
            i++;
        }
    }
}

package util;

import model.Distance.Direction;
import model.Parameter.Personal;
import model.Parameter.ReqParam;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationFeature;
import model.Place.RespParam;
import model.Place.Results;

import java.io.StringWriter;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

public  class Map {
    public void map(ReqParam reqmodel, Personal personal)  {
        int hour = reqmodel.getHour();
        int mins = reqmodel.getMins();
        int limit = ChangeTime(hour,mins);
        int stay = reqmodel.getStay();

        ObjectMapper objectMapper = new ObjectMapper();
        List<RespParam> res = new ArrayList<RespParam>();
        List<Results> resultsList = new ArrayList<Results>();


        //API Google Map
        String lat = reqmodel.getLat();
        String lng = reqmodel.getLng();

        String start_location = lat+","+lng;
        String location_name = reqmodel.getSlocation();
        String idcurrent = reqmodel.getIdplace();
        try {
            if (reqmodel != null) {
                for (String strtype : reqmodel.getTypes()) {
                    RespParam resobj = objectMapper.readValue(new URL("https://maps.googleapis.com/maps/api/place/nearbysearch/json?" +
                            "location="+start_location +
                            "&radius="+Const.DF_RADIUS +
                            "&rating="+Const.rating +
                            "&type="+strtype+
                            "&opennow="+Const.opennow+
                            "&key="+Const.KEY ),RespParam.class);
                    if (resobj != null) {
                        resobj.setType(strtype); //set type to RespParam
                        res.add(resobj); //add type to RespParam
                    }
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        //get result from Response Params
        if (res.size() > 0) {
            for (RespParam resobj : res) { //loop RespParam
                if (resobj.getResults().size() > 0) {
                    for (Results listres : resobj.getResults()) { //loop Results
                        if(listres.getRating() >= 4.1){
                            listres.setType(resobj.getType()); //set type to Results
                            resultsList.add(listres); //add type to Results
                        }
                    }
                }
            }
        }
        resultsList.get(0).setName("Start");
        resultsList.get(0).getGeometry().getLocation().setLat(Double.parseDouble(lat));
        resultsList.get(0).getGeometry().getLocation().setLng(Double.parseDouble(lng));
        resultsList.get(0).setVicinity(location_name);
        resultsList.get(0).setPlace_id(idcurrent);
        for (Results list : resultsList)
        {
            System.out.println("name :"+list.getName());
            System.out.println("type :"+list.getType());
            System.out.println("Rating :"+list.getRating());
            System.out.println("address :"+list.getVicinity());
            System.out.println("place_id :"+list.getPlace_id());

            System.out.println("-----------------------------------------");
        }
        for (Results rate : resultsList){
            System.out.print(rate.getRating()+",");
        }

        System.out.println("SUCESS");

        String distance ;
        ArrayList<Integer> minute = new ArrayList<Integer>();

        //API Google Distance
        String mode = reqmodel.getMode();
        int n = resultsList.size();

        try {
            if (resultsList != null) {
                for(int i=0 ;i<n ;i++){
                    for(int j=i+1 ;j<n ;j++){
                        Direction dt = objectMapper.readValue(new URL("https://maps.googleapis.com/maps/api/distancematrix/json?" +
                                "origins=" + resultsList.get(i).getGeometry().getLocation().getLat() + "," + resultsList.get(i).getGeometry().getLocation().getLng() +
                                "&destinations=" + resultsList.get(j).getGeometry().getLocation().getLat() + "," + resultsList.get(j).getGeometry().getLocation().getLng() +
                                "&units=" + Const.units +
                                "&mode=" + mode +
                                "&key=" + Const.dis_KEY), Direction.class);
                        distance = dt.getRows().get(0).getElements().get(0).getDuration().getText();
                        Split(distance,minute);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        System.out.println("\n---------------function_Matrix------------------------");
        for (Integer m : minute){
            System.out.print(m+",");
        }
        Integer[][] matrix = ToDirectMatrix(minute,n);

        System.out.println();
        for(int a = 0; a < n ;a++){
            for(int b = 0 ; b < n ;b++){
                System.out.print(matrix[a][b]+", ");
            }
            System.out.println();
        }
        ArrayList<Integer> output = new ArrayList<Integer>();
        int [] visit = new int[resultsList.size()];

        System.out.println("---------------function_Backtracking------------------------");

        if(matrix!=null){
            try {
                BacktrackingAlgo bt = new BacktrackingAlgo(); //Call Backtracking
                bt.FunctionBacktracking(limit,visit,0,1,output,matrix,resultsList,0,stay,personal);
                System.out.println(output);
            }catch (Exception e){
                e.printStackTrace();
            }
        }


        System.out.println("success");
        StringWriter stringEmp = new StringWriter();
        objectMapper.configure(SerializationFeature.INDENT_OUTPUT, true);

    }
    public static int ChangeTime(int hour,int mins){
        hour = hour*60 ;
        hour = hour+mins ;
        return hour ;
    }

    public static Integer[][] ToDirectMatrix(ArrayList<Integer> minute, int n){
        Integer[][] matrix = new Integer[n][n];
        int index = 0;
        for (int a = 0; a < n; a++) {
            for (int b = a + 1; b < n; b++) {
                matrix[a][b] = minute.get(index);
                matrix[b][a] = minute.get(index);
                index++;
            }
        }
        return matrix ;
    }

    public static void Split(String distance , ArrayList<Integer> minute ) {
        String[] words= distance.split(" ");
        HourToMinute(words,minute);
    }

    public static void HourToMinute(String[] words,ArrayList<Integer> minute){
        int temp=0;
        int index=0;
        for (int j=0; j<words.length;){
            int number = 0;
            if (words[j+1].contains("hour")) { //Check hour
                number = Integer.parseInt(words[j]);
                number = number * 60;
                index = j+2;
                temp = Integer.parseInt(words[index]);
                minute.add(number+temp);
                j=j+4;
            } else { //Check mins
                number = Integer.parseInt(words[j]);
                minute.add(number);
                j=j+2;

            }
        }
    }
}


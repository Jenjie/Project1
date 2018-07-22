package model.Parameter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class ReqParam {

    private String slocation ;
    private String lat ;
    private String lng ;
    private List<String> types = new ArrayList<>();
    private String mode ;
    private int stay;
    private int hour ;
    private int mins ;
    private String idplace ;

    public String getIdplace() {
        return idplace;
    }

    public void setIdplace(String idplace) {
        this.idplace = idplace;
    }

    public int getStay() {
        return stay;
    }

    public void setStay(int stay) {
        this.stay = stay;
    }

    public int getHour() {
        return hour;
    }

    public void setHour(int hour) {
        this.hour = hour;
    }

    public int getMins() {
        return mins;
    }

    public void setMins(int mins) {
        this.mins = mins;
    }

    public String getMode() {
        return mode;
    }

    public void setMode(String mode) {
        this.mode = mode;
    }

    public String getLat() {
        return lat;
    }

    public void setLat(String lat) {
        this.lat = lat;
    }

    public String getLng() {
        return lng;
    }

    public void setLng(String lng) {
        this.lng = lng;
    }

    public String getSlocation() {
        return slocation;
    }

    public void setSlocation(String slocation) {
        this.slocation = slocation;
    }

    public List<String> getTypes() {
        return types;
    }

    public void setTypes(List<String> types) {
        this.types = types;
    }

}

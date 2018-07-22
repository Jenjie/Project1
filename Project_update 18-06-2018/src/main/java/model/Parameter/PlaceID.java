package model.Parameter;

import java.util.List;

public class PlaceID {
    public List<String> idplace ;
    public String p_id ;
    public List<String> nameplace ;
    public List<String> time ;

    public List<String> getTime() {
        return time;
    }

    public void setTime(List<String> time) {
        this.time = time;
    }

    public List<String> getNameplace() {
        return nameplace;
    }

    public void setNameplace(List<String> nameplace) {
        this.nameplace = nameplace;
    }

    public String getP_id() {
        return p_id;
    }

    public void setP_id(String p_id) {
        this.p_id = p_id;
    }

    public List<String> getIdplace() {
        return idplace;
    }

    public void setIdplace(List<String> idplace) {
        this.idplace = idplace;
    }
}

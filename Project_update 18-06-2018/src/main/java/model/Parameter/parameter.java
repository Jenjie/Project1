package model.Parameter;

import java.util.List;

public class parameter {
    List<String> idplace ;
    String f_id ;
    List<String> location ;
    String mode ;

    public String getMode() {
        return mode;
    }

    public void setMode(String mode) {
        this.mode = mode;
    }

    public List<String> getLocation() {
        return location;
    }
    public void setLocation(List<String> location) {
        this.location = location;
    }
    public String getF_id() {
        return f_id;
    }
    public void setF_id(String f_id) {
        this.f_id = f_id;
    }

    public List<String> getIdplace() {
        return idplace;
    }

    public void setIdplace(List<String> idplace) {
        this.idplace = idplace;
    }
}

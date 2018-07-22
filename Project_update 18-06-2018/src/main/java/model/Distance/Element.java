package model.Distance;


import com.fasterxml.jackson.annotation.JsonProperty;

public class Element {

    private String status;
    private Value distance;
    private Value duration;

    public Element(@JsonProperty("status")String status, @JsonProperty("distance") Value distance, @JsonProperty("duration") Value duration) {
        this.status = status;
        this.distance = distance;
        this.duration = duration;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Value getDistance() {
        return distance;
    }

    public void setDistance(Value distance) {
        this.distance = distance;
    }

    public Value getDuration() {
        return duration;
    }

    public void setDuration(Value duration) {
        this.duration = duration;
    }
}

package model.DatailPlace;

import com.fasterxml.jackson.annotation.JsonProperty;

public class Open {
    private String time;
    private Integer day;

    public Open(@JsonProperty("time")String time, @JsonProperty("day") Integer day) {
        this.time = time;
        this.day = day;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public Integer getDay() {
        return day;
    }

    public void setDay(Integer day) {
        this.day = day;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Open value = (Open) o;

        if (time != null ? !time.equals(value.time) : value.time != null) return false;
        return this.day != null ? this.day.equals(value.day) : value.day == null;
    }

    @Override
    public int hashCode() {
        int result = time != null ? time.hashCode() : 0;
        result = 31 * result + (day != null ? day.hashCode() : 0);
        return result;
    }

}

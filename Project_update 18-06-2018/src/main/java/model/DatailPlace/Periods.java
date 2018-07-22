package model.DatailPlace;

import com.fasterxml.jackson.annotation.JsonProperty;

public class Periods {
    private Open open;
    private Open close;

    public Periods(@JsonProperty("open") Open open, @JsonProperty("close") Open close) {
        this.open = open;
        this.close = close;
    }

}

package model.Distance;

import com.fasterxml.jackson.annotation.JsonProperty;

public class Value {
    private String text;
    private Integer value;

    public Value(@JsonProperty("text")String text, @JsonProperty("value") Integer value) {
        this.text = text;
        this.value = value;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public Integer getValue() {
        return value;
    }

    public void setValue(Integer value) {
        this.value = value;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Value value = (Value) o;

        if (text != null ? !text.equals(value.text) : value.text != null) return false;
        return this.value != null ? this.value.equals(value.value) : value.value == null;
    }

    @Override
    public int hashCode() {
        int result = text != null ? text.hashCode() : 0;
        result = 31 * result + (value != null ? value.hashCode() : 0);
        return result;
    }
}

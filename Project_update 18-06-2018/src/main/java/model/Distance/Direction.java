package model.Distance;

import com.fasterxml.jackson.annotation.JsonProperty;

import java.util.List;

public class Direction {

    private List<String> destination_addresses;
    private List<String> origin_addresses;
    private List<ElementListModel> rows;
    private String status;

    public Direction(@JsonProperty("destination_addresses")List<String> destination_addresses, @JsonProperty("origin_addresses") List<String> origin_addresses, @JsonProperty("rows") List<ElementListModel> rows, @JsonProperty("status") String status) {
        this.destination_addresses = destination_addresses;
        this.origin_addresses = origin_addresses;
        this.rows = rows;
        this.status = status;
    }

    public List<String> getDestination_addresses() {
        return destination_addresses;
    }

    public void setDestination_addresses(List<String> destination_addresses) {
        this.destination_addresses = destination_addresses;
    }

    public List<String> getOrigin_addresses() {
        return origin_addresses;
    }

    public void setOrigin_addresses(List<String> origin_addresses) {
        this.origin_addresses = origin_addresses;
    }

    public List<ElementListModel> getRows() {
        return rows;
    }

    public void setRows(List<ElementListModel> rows) {
        this.rows = rows;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Direction direction = (Direction) o;

        if (destination_addresses != null ? !destination_addresses.equals(direction.destination_addresses) : direction.destination_addresses != null) return false;
        if (origin_addresses != null ? !origin_addresses.equals(direction.origin_addresses) : direction.origin_addresses != null) return false;
        if (rows != null ? !rows.equals(direction.rows) : direction.rows != null) return false;
        return status != null ? status.equals(direction.status) : direction.status == null;
    }

    @Override
    public int hashCode() {
        int result = destination_addresses != null ? destination_addresses.hashCode() : 0;
        result = 31 * result + (origin_addresses != null ? origin_addresses.hashCode() : 0);
        result = 31 * result + (rows != null ? rows.hashCode() : 0);
        result = 31 * result + (status != null ? status.hashCode() : 0);
        return result;
    }
}

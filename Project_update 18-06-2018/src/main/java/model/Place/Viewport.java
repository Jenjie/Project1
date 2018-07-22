package model.Place;

public class Viewport {
    private Coordinates northeast;
    private Coordinates southwest;

    public Coordinates getNortheast() {
        return northeast;
    }

    public void setNortheast(Coordinates northeast) {
        this.northeast = northeast;
    }

    public Coordinates getSouthwest() {
        return southwest;
    }

    public void setSouthwest(Coordinates southwest) {
        this.southwest = southwest;
    }
}

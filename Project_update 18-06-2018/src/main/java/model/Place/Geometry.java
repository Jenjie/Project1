package model.Place;

public class Geometry {

    private Coordinates location;
    private Viewport Viewport;

    public Coordinates getLocation() {
        return location;
    }

    public void setLocation(Coordinates location) {
        this.location = location;
    }

    public Viewport getViewport() {
        return Viewport;
    }

    public void setViewport(Viewport viewport) {
        Viewport = viewport;
    }
}

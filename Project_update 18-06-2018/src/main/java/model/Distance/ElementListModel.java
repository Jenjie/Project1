package model.Distance;


import com.fasterxml.jackson.annotation.JsonProperty;

import java.util.List;

public class ElementListModel {
    private List<Element> elements;

    public ElementListModel(@JsonProperty("elements")List<Element> elements) {
        this.elements = elements;
    }

    public List<Element> getElements() {
        return elements;
    }

    public void setElements(List<Element> elements) {
        this.elements = elements;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        ElementListModel elementListModel = (ElementListModel) o;

        return elements != null ? elements.equals(elementListModel.elements) : elementListModel.elements == null;
    }

    @Override
    public int hashCode() {
        return elements != null ? elements.hashCode() : 0;
    }
}
